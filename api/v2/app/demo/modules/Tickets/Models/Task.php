<?php
namespace App\Tickets\Models;

class Task extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'id_trip',
            'App\Trips\Models\Trip',
            'id_trip',
            array(
                'alias' => 'Trip'
            )
        );
    }
    
    public function getSource() {
        return 'ticket_task';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data = array_merge($data, $this->trip->toArray());
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');

        return $data;
    }

}