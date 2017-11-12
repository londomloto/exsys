<?php
namespace App\Trips\Models;

use App\Trips\Models\Item;

class ItemHistory extends \Micro\Model {
    
    public function getSource() {
        return 'trip_item_history';
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
        $data['departure_date_formatted'] = date('d/m/Y', strtotime($data['departure_date']));
        $data['transport_name'] = $data['transport'] == 1 ? 'Air Plane' : 'Train';
        $data['transport_prices_formatted'] = \Micro\Helpers\Number::format($data['transport_prices']);
        $data['has_attachment'] = $this->hasAttachment();
        $data['status_name'] = Item::getStatusName($this->status);
        
        return $data;
    }
}