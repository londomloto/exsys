<?php
namespace App\Advance\Models;

class Task extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'id_adv',
            'App\Advance\Models\Advance',
            'id_adv',
            array(
                'alias' => 'Advance'
            )
        );
    }

    public function getSource() {
        return 'advance_task';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data = array_merge($data, $this->advance->toArray());
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');

        return $data;
    }

}