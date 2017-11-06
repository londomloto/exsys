<?php
namespace App\Trips\Models;

use App\Users\Models\User,
    App\Trips\Models\History,
    App\Trips\Models\Task,
    App\Statuses\Models\Status;

class Trip extends \Micro\Model {

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
        
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');
        
        $data['ticket_approvable'] = FALSE;
        $data['ticket_approved'] = $this->ticket_status == 1 ? TRUE : FALSE;

        foreach($this->items as $item) {
            if ( ! empty($item->transport_operator)) {
                $data['ticket_approvable'] = TRUE;
                break;
            }
        }

        return $data;
    }

    public function submit() {
        $user = \Micro\App::getDefault()->auth->user();

        // create history
        $history = new History();
        $history->id_trip = $this->id_trip;
        $history->status_id = Status::val('submitted');
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');

        if ($history->save()) {
            $this->status = $history->status_id;
            $this->save();

            $user = User::get($user['su_id'])->data;

            // entry task
            $superiors = $user->getSuperiors($this->getAmounts());

            foreach($superiors as $super) {
                $task = new \App\Tasks\Models\Task();
                
                $task->t_type = 'trip';
                $task->t_link = $this->id_trip;
                $task->t_code = $this->trip_no;
                $task->t_user = $super['user_id'];
                $task->t_date = date('Y-m-d H:i:s');
                $task->t_read = 0;

                $task->save();
            }

            // submit advance if any
            if ($this->advance) {
                $this->advance->submit();
            }
        }
    }

    public function reject($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();
        $prevStatus = $this->status;

        \App\Tasks\Models\Task::find(array(
            't_type = :type: AND t_link = :link:',
            'bind' => array(
                'type' => 'trip',
                'link' => $this->id_trip
            )
        ))->delete();

        $status = Status::val('reject');

        // tambah history
        $history = new History();
        $history->id_trip = $this->id_trip;
        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $post['notes'];

        $history->save();

        // update status
        $this->status = $status;
        $this->save();

        // sync advance
        if ($this->advance && $this->advance->status == $prevStatus) {
            $this->advance->reject($post);
        }
    }

    public function returned($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();
        $prevStatus = $this->status;

        // delete tasks
        \App\Tasks\Models\Task::find(array(
            't_type = :type: AND t_link = :link:',
            'bind' => array(
                'type' => 'trip',
                'link' => $this->id_trip
            )
        ))->delete();

        $status = Status::val('change-request');

        // tambah history
        $history = new History();
        $history->id_trip = $this->id_trip;
        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $post['notes'];

        $history->save();

        // update status
        $this->status = $status;
        $this->save();

        if ($this->advance && $this->advance->status == $prevStatus) {
            $this->advance->returned($post);
        }
    }

    public function approve($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();
        $prevStatus = $this->status;

        // delete lower tasks 
        if ($user['su_grade_type'] == 'verificator') {
            
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link: AND t_user = :user:',
                'bind' => array(
                    'type' => 'trip',
                    'link' => $this->id_trip,
                    'user' => $user['su_id']
                )
            ))->delete();

        } else if ($user['su_grade_type'] == 'approver') {
            $tasks = \App\Tasks\Models\Task::get()
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

        // tambah history
        $history = new History();
        $history->id_trip = $this->id_trip;

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

        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $post['notes'];

        $history->save();

        // update status
        $this->status = $status;
        $this->save();

        // sync advance
        if ($this->advance && $this->advance->status == $prevStatus) {
            $this->advance->approve($post);
        }

        if ($this->status == Status::val('final-approved')) {
            $this->requestTicket();
        }
    }

    public function requestTicket() {

        $user = \Micro\App::getDefault()->auth->user();
        $subscribers = User::findInRoles(array('ticketing'));

        foreach($subscribers as $sub) {
            $task = new \App\Tasks\Models\Task();
                
            $task->t_type = 'trip-ticket';
            $task->t_link = $this->id_trip;
            $task->t_code = $this->trip_no;
            $task->t_user = $sub->su_id;
            $task->t_date = date('Y-m-d H:i:s');
            $task->t_read = 0;

            $task->save();

        }

    }

}