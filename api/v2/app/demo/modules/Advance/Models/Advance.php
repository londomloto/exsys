<?php
namespace App\Advance\Models;

use App\Advance\Models\History,
    App\Advance\Models\Task,
    App\Users\Models\User,
    App\Statuses\Models\Status,
    Phalcon\Mvc\Model\Relation;

class Advance extends \Micro\Model {

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
                'alias' => 'AdvanceType'
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
            'received_by',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'Receiver'
            )
        );

        $this->hasOne(
            'purpose',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'AdvancePurpose'
            )
        );

        $this->hasMany(
            'id_adv',
            'App\Advance\Models\Item',
            'id_adv',
            array(
                'alias' => 'Items',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasMany(
            'id_adv',
            'App\Advance\Models\Task',
            'id_adv',
            array(
                'alias' => 'Tasks',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasMany(
            'id_adv',
            'App\Advance\Models\History',
            'id_adv',
            array(
                'alias' => 'History',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );
    }

    public function getSource() {
        return 'advance_table';
    }

    public function beforeSave() {
        $this->type = $this->type == '' ? NULL : $this->type;
        $this->purpose = $this->purpose == '' ? NULL : $this->purpose;
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
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');

        if ($this->lastStatus) {
            $data['status_code'] = $this->lastStatus->status_code;
            $data['status_name'] = $this->lastStatus->status_name;
            $data['status_color'] = empty($this->lastStatus->status_color) ? 'var(--paper-grey-400)' : $this->lastStatus->status_color;
        }

        if ($this->advanceType) {
            $data['type_name'] = $this->advanceType->type_name;
        }

        if ($this->advancePurpose) {
            $data['purpose_name'] = $this->advancePurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        $data['received_date_short'] = date('d/m/Y', strtotime($this->received_date));

        if ($this->receiver) {
            $data['received_by_name'] = $this->receiver->su_fullname;
        }

        return $data;
    }

    public function updateAmounts() {
        $amounts = 0;

        foreach($this->items as $elem) {
            $line = ($elem->currency_rate * $elem->amounts);
            $amounts += $line;
        }

        $this->amounts = $amounts;
        $this->save();
    }

    public function submit() {
        $user = \Micro\App::getDefault()->auth->user();

        // create history
        $history = new History();
        $history->id_adv = $this->id_adv;
        $history->status_id = 2;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');

        if ($history->save()) {
            $this->status = $history->status_id;
            $this->save();

            $user = User::get($user['su_id'])->data;

            // entry task
            $superiors = $user->getSuperiors($this->amounts);

            foreach($superiors as $super) {
                $task = new Task();

                $task->id_adv = $this->id_adv;
                $task->su_id = $super['user_id'];
                $task->grade_id = $super['grade_id'];
                $task->is_allowed = 1;
                
                $task->save();
            }

            return TRUE;
        }

        return FALSE;
    }

    public function reject($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();

        // delete tasks
        Task::find(array(
            'id_adv = :advance:',
            'bind' => array(
                'advance' => $this->id_adv
            )
        ))->delete();

        $status = Status::val('reject');

        // tambah history
        $history = new History();
        $history->id_adv = $this->id_adv;
        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $post['notes'];

        $history->save();

        // update status
        $this->status = $status;
        $this->save();
    }

    public function approve($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();

        // delete lower tasks 
        if ($user['su_grade_type'] == 'verificator') {
            Task::find(array(
                'id_adv = :advance: AND su_id = :user:',
                'bind' => array(
                    'advance' => $this->id_adv,
                    'user' => $user['su_id']
                )
            ))->delete();    
        } else if ($user['su_grade_type'] == 'approver') {
            $tasks = Task::get()
                ->where('id_adv = :advance: AND a.grade_limit <= :limit:', array(
                    'advance' => $this->id_adv,
                    'limit' => (int) $user['su_grade_limit']
                ))
                ->join('App\Grades\Models\Grade', 'a.grade_id = App\Advance\Models\Task.grade_id', 'a')
                ->execute();

            foreach($tasks as $task) {
                $task->delete();
            }
        }

        // tambah history
        $history = new History();
        $history->id_adv = $this->id_adv;

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

        if ($status == Status::val('final-approved')) {
            $this->faSubmit('receive-request');
        }
    }

    public function returned($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();

        // delete tasks
        Task::find(array(
            'id_adv = :advance:',
            'bind' => array(
                'advance' => $this->id_adv
            )
        ))->delete();

        $status = Status::val('change-request');

        // tambah history
        $history = new History();
        $history->id_adv = $this->id_adv;
        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $post['notes'];

        $history->save();

        // update status
        $this->status = $status;
        $this->save();
    }

    public function faSubmit($action) {
        $user = \Micro\App::getDefault()->auth->user();

        // broadcast tasks to fa subscriber
        switch($action) {
            case 'receive-request';
                $subscribers = User::findInRoles(array('fa-receiver'));
                break;
            case 'approval-request':
                $subscribers = User::findInRoles(array('fa-approver'));
                break;
        }
        
        foreach($subscribers as $sub) {
            $task = new \App\Finance\Models\Task();
            $task->module = 'advance';
            $task->id_ref = $this->id_adv;
            $task->su_id = $sub->su_id;
            $task->is_allowed = 1;
            $task->action = $action;
            
            $task->save();
        }
    }

    public function getSummary() {
        $summary = array();

        $items = $this->items->filter(function($row){ return $row; });

        usort($items, function($a, $b){
            $va = $a->currency_id;
            $vb = $b->currency_id;

            if ($va == $vb) return 0;
            return $va < $vb ? -1 : 1;
        });

        foreach($items as $row) {
            $item = $row->toArray();
            $code = $item['currency_code'];

            if ( ! isset($summary[$code])) {
                $summary[$code] = array(
                    'currency_id' => $item['currency_id'],
                    'currency_name' => $item['currency_name'],
                    'currency_code' => $item['currency_code'],
                    'currency_rate' => $item['currency_rate'],
                    'summary_value' => 0,
                    'summary_label' => 'Total advance in '.$code.' ('.$item['currency_name'].')'
                );
            }

            $summary[$code]['summary_value'] += ($item['amounts']);
            $summary[$code]['summary_value_formatted'] = number_format($summary[$code]['summary_value'], 2, ',', '.');
        }

        $summary = array_values($summary);
        return $summary;
    }

}