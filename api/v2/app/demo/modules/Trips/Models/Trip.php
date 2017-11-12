<?php
namespace App\Trips\Models;

use App\Users\Models\User,
    App\Trips\Models\History,
    App\Trips\Models\Item,
    App\Statuses\Models\Status,
    App\Tasks\Models\Task;

class Trip extends \Micro\Model {

    const STATUS_TICKET_REQUEST = 0;
    const STATUS_TICKET_ISSUED = 1;
    const STATUS_TICKET_REJECTED = 2;
    const STATUS_TICKET_RESCHEDULING = 3;
    const STATUS_TICKET_RESCHEDULED = 4;

    public function initialize() {
        $this->hasOne(
            'status',
            'App\Statuses\Models\Status',
            'status_id',
            array(
                'alias' => 'LastStatus'
            )
        );

        $this->hasOne(
            'type',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'TripType'
            )
        );

        $this->hasOne(
            'id_user',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );

        $this->hasOne(
            'purpose',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'TripPurpose'
            )
        );

        $this->hasMany(
            'id_trip',
            'App\Trips\Models\Item',
            'id_trip',
            array(
                'alias' => 'Items'
            )
        );

        $this->hasMany(
            'id_trip',
            'App\Trips\Models\History',
            'id_trip',
            array(
                'alias' => 'History'
            )
        );

        $this->hasOne(
            'adv_ref',
            'App\Advance\Models\Advance',
            'id_adv',
            array(
                'alias' => 'Advance'
            )
        );
    }

    public function getSource() {
        return 'trip_table';
    }

    public function beforeSave() {
        $this->type = $this->type == '' ? NULL : $this->type;
        $this->purpose = $this->purpose == '' ? NULL : $this->purpose;
    }

    public function hasAttachment() {
        $attachment = $this->getAttachment();
        if ( ! empty($attachment)) {
            return file_exists($attachment);
        }
        return FALSE;
    }

    public function getAttachment() {
        if ( ! empty($this->attachment)) {
            return APPPATH.'public/resources/attachments/'.$this->attachment;
        }
        return '';
    }

    public function getAmounts() {
        $amounts = 0;

        if ($this->advance) {
            $amounts = $this->advance->amounts;
        }
        return $amounts;
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['status_name'] = '';
        $data['type_name'] = '';
        $data['purpose_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));
        $data['date_start_short'] = date('d/m/Y', strtotime($this->date_start));
        $data['date_end_short'] = date('d/m/Y', strtotime($this->date_end));
        $data['has_items'] = $this->items->count() > 0 ? 1 : 0;
        $data['has_advance'] = FALSE;
        $data['has_attachment'] = $this->hasAttachment();

        if ($this->lastStatus) {
            $data['status_code'] = $this->lastStatus->status_code;
            $data['status_name'] = $this->lastStatus->status_name;
            $data['status_color'] = empty($this->lastStatus->status_color) ? 'var(--paper-grey-400)' : $this->lastStatus->status_color;
        }

        if ($this->tripType) {
            $data['type_name'] = $this->tripType->type_name;
        }

        if ($this->tripPurpose) {
            $data['purpose_name'] = $this->tripPurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        if ($this->advance) {
            $advance = $this->advance->toArray();
            $data['has_advance'] = TRUE;

            $data['amounts'] = $advance['amounts'];
            $data['adv_no'] = $advance['adv_no'];
            $data['adv_subject'] = $advance['subject_adv'];
            $data['adv_desc'] = $advance['adv_no'].' ('. $advance['subject_adv'] .')';
            $data['adv_status_name'] = $advance['status_name'];
        }
        
        $data['amounts_formatted'] = \Micro\Helpers\Number::format($data['amounts']);
        $data['ticket_issuable'] = FALSE;

        foreach($this->items as $item) {
            if ($item->isIssuable()) {
                $data['ticket_issuable'] = TRUE;
                break;
            }
        }

        return $data;
    }

    public function submit() {
        // update status
        $this->status = Status::val('submitted');

        if ($this->save()) {
            // log history
            History::log('trip', $this);

            // log tasks
            $auth = \Micro\App::getDefault()->auth->user();
            $user = User::get($auth['su_id'])->data;

            $subscribers = $user->getSuperiors($this->getAmounts());

            foreach($subscribers as $sub) {
                Task::log('trip', $sub['user_id'], $this);
            }

            // submit advance if any
            if ($this->advance) {
                $this->advance->submit();
            }
        }

    }

    public function reject($post = array()) {
        $prevStatus = $this->status;

        // update status
        $this->status = Status::val('reject');

        if ($this->save()) {
            // delete tasks
            Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip',
                    'link' => $this->id_trip
                )
            ))->delete();

            // log history
            History::log('trip', $this, $post['notes']);

            // sync advance
            if ($this->advance && $this->advance->status == $prevStatus) {
                $this->advance->reject($post);
            }
        }
        
    }

    public function returned($post = array()) {
        $prevStatus = $this->status;

        // update status
        $this->status = Status::val('change-request');

        if ($this->save()) {
            // delete tasks
            Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip',
                    'link' => $this->id_trip
                )
            ))->delete();

            // log history
            History::log('trip', $this, $post['notes']);

            if ($this->advance && $this->advance->status == $prevStatus) {
                $this->advance->returned($post);
            }
        }
    }

    public function approve($post = array()) {
        $prevStatus = $this->status;
        $user = \Micro\App::getDefault()->auth->user();

        // update status
        $status = NULL;

        if ($user['su_grade_type'] == 'verificator') {
            $status = Status::val('verified');
        } else {
            if ($user['su_grade_limit'] >= 15000000) {
                $status = Status::val('final-approved');
            } else {
                $status = Status::val('approved');
            }
        }

        $this->status = $status;

        if ($this->save()) {
            // delete lower tasks 
            if ($user['su_grade_type'] == 'verificator') {
                
                Task::find(array(
                    't_type = :type: AND t_link = :link: AND t_user = :user:',
                    'bind' => array(
                        'type' => 'trip',
                        'link' => $this->id_trip,
                        'user' => $user['su_id']
                    )
                ))->delete();

            } else if ($user['su_grade_type'] == 'approver') {
                $tasks = Task::get()
                    ->where('t_type = :type: AND t_link = :link: AND grade.grade_limit <= :amounts:', array(
                        'type' => 'trip',
                        'link' => $this->id_trip,
                        'amounts' => (int) $user['su_grade_limit']
                    ))
                    ->join('App\Users\Models\User', 'user.su_id = App\Tasks\Models\Task.t_user', 'user')
                    ->join('App\Grades\Models\Grade', 'grade.grade_id = user.su_grade_id', 'grade')
                    ->execute();

                foreach($tasks as $task) {
                    $task->delete();
                }
            }

            // log history
            History::log('trip', $this, $post['notes']);

            // sync advance
            if ($this->advance && $this->advance->status == $prevStatus) {
                $this->advance->approve($post);
            }

            if ($this->status == Status::val('final-approved')) {
                $this->requestTicket();
            }
        }
    }

    public function requestTicket() {
        // update ticket status
        $this->ticket_status = self::STATUS_TICKET_REQUEST;

        if ($this->save()) {
            // delegate task
            $subscribers = User::findInRoles(array('ticketing'));

            foreach($subscribers as $sub) {
                Task::log('trip-ticket-request', $sub->su_id, $this);
            }

            // update item status
            foreach($this->items as $item) {
                $item->status = Item::STATUS_REQUEST;
                $item->save();
            }
        }
        
    }

    public function acceptTicket() {
        $user = \Micro\App::getDefault()->auth->user();
        
        Task::find(array(
            't_type = :type: AND t_link = :link:',
            'bind' => array(
                'type' => 'trip-ticket-request',
                'link' => $this->id_trip
            )
        ))->delete();

        // update trip status;
        $this->status = Status::val('ticket-issued');
        $this->ticket_status = self::STATUS_TICKET_ISSUED;
        $this->save();

        // update items status
        foreach($this->items as $item) {
            if ($item->isIssuable()) {
                $item->status = Item::STATUS_ISSUED;
            } else {
                $item->status = Item::STATUS_EMPTY;
            }
            $item->save();
        }
        
        // log history
        History::log('trip', $this);
    }

    public function acceptReschedule() {
        $user = \Micro\App::getDefault()->auth->user();
        
        Task::find(array(
            't_type = :type: AND t_link = :link:',
            'bind' => array(
                'type' => 'trip-ticket-reschedule',
                'link' => $this->id_trip
            )
        ))->delete();

        // update trip status;
        $this->status = Status::val('ticket-issued');
        $this->ticket_status = self::STATUS_TICKET_RESCHEDULED;
        $this->save();

        // update items status
        foreach($this->items as $item) {
            if ($item->isIssuable()) {
                $item->status = Item::STATUS_RESCHEDULED;
                $hist = $item->getLastHistory();
                if ($hist) {
                    $hist->status = Item::STATUS_CANCELED;
                    $hist->save();
                }
            } else {
                $item->status = Item::STATUS_EMPTY;
            }
            $item->save();
        }
        
        // log history
        History::log('trip', $this);
    }

    public function rescheduleTicket() {
        $user = \Micro\App::getDefault()->auth->user();

        Task::find(array(
            't_type = :type: AND t_link = :link:',
            'bind' => array(
                'type' => 'trip-ticket-reschedule',
                'link' => $this->id_trip
            )
        ))->delete();

        // update trip status;
        $this->status = Status::val('ticket-issued');
        $this->ticket_status = self::STATUS_TICKET_RESCHEDULED;
        $this->save();

        // update items status
        foreach($this->items as $item) {
            if ($item->isIssuable()) {
                $item->status = Item::STATUS_RESCHEDULED;
            } else {
                $item->status = Item::STATUS_EMPTY;
            }
            $item->save();
        }
        
        // log history
        History::log('trip', $this);
    }

    public function rejectTicket() {
        // update status
        $this->status = Status::val('no-ticket');
        $this->ticket_status = self::STATUS_TICKET_REJECTED;

        if ($this->save()) {
            // delete tasks
            Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip-ticket-request',
                    'link' => $this->id_trip
                )
            ))->delete();

            // update items
            foreach($this->items as $item) {
                $item->status = Item::STATUS_REJECT;
                $item->save();
            }

            // log history
            History::log('trip', $this);
        }
        
    }

    public function rejectReschedule() {
        // update status
        $this->status = Status::val('ticket-issued');
        $this->ticket_status = self::STATUS_TICKET_ISSUED;

        if ($this->save()) {
            // delete tasks
            Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip-ticket-reschedule',
                    'link' => $this->id_trip
                )
            ))->delete();

            // update items
            foreach($this->items as $item) {
                if ($item->isIssuable()) {
                    $item->status = Item::STATUS_ISSUED;
                    $hist = $item->getLastHistory();
                    if ($hist) {
                        $hist->delete();
                    }
                } else {
                    $item->status = Item::STATUS_EMPTY;
                }
                $item->save();
            }

            // log history
            History::log('trip', $this, "Reschedule not accepted and tickets have been reverted");
        }
        
    }
}