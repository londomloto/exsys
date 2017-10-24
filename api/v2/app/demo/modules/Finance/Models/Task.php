<?php
namespace App\Finance\Models;

class Task extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'id_exp',
            'App\Expense\Models\Expense',
            'id_exp',
            array(
                'alias' => 'Expense'
            )
        );
    }
    
    public function getSource() {
        return 'fa_task';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        
        $data = array_merge($data, $this->expense->toArray());
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');
        
        return $data;
    }

}