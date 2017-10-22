<?php
namespace App\Expense\Models;

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
}