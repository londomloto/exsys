<?php
namespace App\Trips\Models;

class Item extends \Micro\Model {

    public function initialize() {
        $this->belongsTo(
            'id_trip',
            'App\Trips\Models\Trip',
            'id_trip',
            array(
                'alias' => 'Trip'
            )
        );
    }

    public function getSource() {
        return 'trip_item';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['departure_date_short'] = date('d/m/Y', strtotime($data['departure_date']));
        $data['transport_name'] = $data['transport'] == 1 ? 'Air Plane' : 'Train';
        $data['transport_prices_formatted'] = number_format($data['transport_prices'], 2, ',', '.');
        return $data;
    }

}