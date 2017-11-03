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
            $seed = $this->seed->toArray();
            
            $data['seed_name'] = $seed['seed_name'];
            $data['seed_label'] = $seed['seed_label'];
        }
        
        return $data;
    }
}