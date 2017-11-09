<?php
namespace App\Trips\Models;

class Item extends \Micro\Model {

    const STATUS_ISSUED = 1;
    const STATUS_CANCELED = 2;
    const STATUS_RESCHEDULING = 3;
    const STATUS_RESCHEDULED = 4;
    
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

    public function getStatusName() {
        return $this->status == self::STATUS_ISSUED 
            ? 'Issued' 
            : ( $this->status == self::STATUS_RESCHEDULING
                ? 'Rescheduling' 
                : ( $this->status == self::STATUS_RESCHEDULED 
                    ? 'Rescheduled' 
                    : ( $this->status == self::STATUS_CANCELED 
                        ? 'Canceled' 
                        : '-' )));
    }

    public function hasAttachment() {
        $attachment = $this->getAttachment();

        if ( ! empty($attachment)) {
            return file_exists($attachment);
        }
        return FALSE;
    }

    public function getAttachment() {
        if ( ! empty($this->attachment)) {
            return APPPATH.'public/resources/attachments/'.$this->attachment;
        }
        return '';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        $data['departure_date_short'] = date('d/m/Y', strtotime($data['departure_date']));
        $data['transport_name'] = $data['transport'] == 1 ? 'Air Plane' : 'Train';
        $data['transport_prices_formatted'] = \Micro\Helpers\Number::format($data['transport_prices'], 2, 'accounting');
        $data['has_attachment'] = $this->hasAttachment();
        $data['status_name'] = $this->getStatusName();
        $data['ticket_issued'] = $this->status == self::STATUS_ISSUED || $this->status == self::STATUS_RESCHEDULED;

        return $data;
    }

}