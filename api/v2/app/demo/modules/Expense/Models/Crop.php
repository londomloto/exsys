<?php
namespace App\Expense\Models;

use Phalcon\Mvc\Model\Relation;

class Crop extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'seed_id',
            'App\Seeds\Models\Seed',
            'seed_id',
            array(
                'alias' => 'Seed'
            )
        );
    }

    public function getSource() {
        return 'expense_crop';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        if ($this->seed) {
            $data['seed_name'] = $this->seed->seed_name;
        }
        
        return $data;
    }
}