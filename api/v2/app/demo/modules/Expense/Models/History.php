<?php
namespace App\Expense\Models;

class History extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'user_act',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );

        $this->hasOne(
            'status_id',
            'App\Statuses\Models\Status',
            'status_id',
            array(
                'alias' => 'Status'
            )
        );
    }

    public function getSource() {
        return 'expense_history';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['user_act_name'] = '';
        $data['status_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));

        if ($this->user) {
            $data['user_act_name'] = $this->user->su_fullname;
        } else if ($this->user_act == 0) {
            $data['user_act_name'] = 'System';
        }

        if ($this->status) {
            $data['status_name'] = $this->status->status_name;
        }

        return $data;
    }

}