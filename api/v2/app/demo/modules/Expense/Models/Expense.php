<?php
namespace App\Expense\Models;

use App\Expense\Models\Task,
    App\Expense\Models\History,
    App\Users\Models\User,
    App\Statuses\Models\Status;

class Expense extends \Micro\Model {
    
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
                'alias' => 'ExpenseType'
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
                'alias' => 'ExpensePurpose'
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\Item',
            'id_exp',
            array(
                'alias' => 'Items'
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\History',
            'id_exp',
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
        return 'expense_table';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['editable'] = FALSE;
        
        if ($data['status'] == Status::val('draft') || $data['status'] == Status::val('change-request')) {
            $data['editable'] = TRUE;
        }

        $data['status_name'] = '';
        $data['type_name'] = '';
        $data['purpose_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));

        $time_start = strtotime($this->date_start);
        $time_end = strtotime($this->date_end);

        $data['date_start_short'] = date('d/m/Y', $time_start);
        $data['date_end_short'] = date('d/m/Y', $time_end);
        $data['period'] = date('F Y', $time_start);
        $data['has_items'] = $this->items->count() > 0 ? 1 : 0;
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');
        
        if ($this->lastStatus) {
            $data['status_name'] = $this->lastStatus->status_name;
            $data['status_color'] = empty($this->lastStatus->status_color) ? 'var(--paper-grey-400)' : $this->lastStatus->status_color;
        }

        if ($this->expenseType) {
            $data['type_name'] = $this->expenseType->type_name;
        }

        if ($this->expensePurpose) {
            $data['purpose_name'] = $this->expensePurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        if ($this->advance) {
            $data['adv_no'] = $this->advance->adv_no;
        }

        $data['received_date_short'] = date('d/m/Y', strtotime($this->received_date));

        if ($this->receiver) {
            $data['received_by_name'] = $this->receiver->su_fullname;
        }

        return $data;
    }


    public function getGroupedItems() {
        $items = $this->items->filter(function($elem){
            return $elem->toArray();
        });

        usort($items, function($a, $b){
            $va = (int)$a['item_parent_id'];
            $vb = (int)$b['item_parent_id'];

            if ($va == $vb) return 0;
            return $va < $vb ? -1 : 1;
        });

        $groups = array();

        foreach($items as $idx => $item) {
            $group = $item['item_parent_id'];
            
            $item['item_seq'] = ($idx + 1);

            if ( ! isset($groups[$group])) {
                $groups[$group] = array();
                $groups[$group]['group_id'] = $item['item_parent_id'];
                $groups[$group]['group_name'] = $item['item_parent_name'];
                $groups[$group]['group_items'] = array($item);
            } else {
                $groups[$group]['group_items'][] = $item;
            }
        }

        $groups = array_values($groups);

        return $groups;
    }

    public function updateAmounts() {
        $amounts = 0;

        foreach($this->items as $elem) {
            $line = $elem->currency_rate * $elem->amounts;
            $amounts += $line;
        }

        $this->amounts = $amounts;
        $this->save();
    }

    public function submit() {
        $user = \Micro\App::getDefault()->auth->user();

        // create history
        $history = new History();
        $history->id_exp = $this->id_exp;
        $history->status_id = Status::val('submitted');
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

                $task->id_exp = $this->id_exp;
                $task->su_id = $super['user_id'];
                $task->grade_id = $super['grade_id'];
                $task->is_allowed = 1;
                
                $task->save();
            }
        }
    }

    public function hrSubmit() {

    }

    public function faSubmit($request) {
        $user = \Micro\App::getDefault()->auth->user();

        // broadcast tasks to fa subscriber
        switch($request) {
            case 'receive-request';
                $subscribers = User::findInRoles(array('fa-receiver'));
                break;
            case 'approval-request':
                $subscribers = User::findInRoles(array('fa-approver'));
                break;
        }
        
        foreach($subscribers as $sub) {
            $task = new \App\Finance\Models\Task();

            $task->id_exp = $this->id_exp;
            $task->su_id = $sub->su_id;
            $task->is_allowed = 1;
            $task->catagory = $request;
            
            $task->save();
        }
    }

    public function approve($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();

        // delete lower tasks 
        if ($user['su_grade_type'] == 'verificator') {
            Task::find(array(
                'id_exp = :expense: AND su_id = :user:',
                'bind' => array(
                    'expense' => $this->id_exp,
                    'user' => $user['su_id']
                )
            ))->delete();    
        } else if ($user['su_grade_type'] == 'approver') {
            $tasks = Task::get()
                ->where('id_exp = :expense: AND a.grade_limit <= :limit:', array(
                    'expense' => $this->id_exp,
                    'limit' => (int) $user['su_grade_limit']
                ))
                ->join('App\Grades\Models\Grade', 'a.grade_id = App\Expense\Models\Task.grade_id', 'a')
                ->execute();

            foreach($tasks as $task) {
                $task->delete();
            }
        }

        // tambah history
        $history = new History();
        $history->id_exp = $this->id_exp;

        $status = NULL;
        $notes = isset($post['notes']) ? $post['notes'] : '-';

        if ($user['su_grade_type'] == 'verificator') {
            $status = Status::val('verified');
        } else {
            if ($user['su_grade_limit'] >= 15000000) {
                $status = Status::val('final-approved');
                // send to fa
                $this->faSubmit('receive-request');
            } else {
                $status = Status::val('approved');
            }
        }

        $history->status_id = $status;
        $history->user_act = $user['su_id'];
        $history->date = date('Y-m-d H:i:s');
        $history->notes = $notes;
        $history->save();

        // update status
        $this->status = $status;
        $this->save();
    }

    
}