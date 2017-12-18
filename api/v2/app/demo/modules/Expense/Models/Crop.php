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
        $data['seed_parent_id'] = '';

        if ($this->seed) {
            $seed = $this->seed->toArray();
            
            $data['seed_name'] = $seed['seed_name'];
            $data['seed_label'] = $seed['seed_label'];

            if ($this->seed->parent) {
                $data['seed_parent_id'] = $this->seed->parent->seed_id;
                $data['seed_parent_name'] = $this->seed->parent->seed_name;
            }
        }
        
        return $data;
    }
}