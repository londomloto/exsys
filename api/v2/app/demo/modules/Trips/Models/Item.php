<?php
namespace App\Trips\Models;

class Item extends \Micro\Model {

    const STATUS_REQUEST = 0;
    const STATUS_ISSUED = 1;
    const STATUS_RESCHEDULING = 2;
    const STATUS_RESCHEDULED = 3;
    const STATUS_REJECT = 4;
    const STATUS_CANCELED = 5;
    const STATUS_EMPTY = 6;
    const STATUS_REVISION = 7;
    
    public function initialize() {
        $this->belongsTo(
            'id_trip',
            'App\Trips\Models\Trip',
            'id_trip',
            array(
                'alias' => 'Trip'
            )
        );

        $this->hasMany(
            'trip_item_id',
            'App\Trips\Models\ItemHistory',
            'trip_item_id',
            array(
                'alias' => 'History'
            )
        );
    }

    public function getSource() {
        return 'trip_item';
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

    public function isIssuable() {
        $statuses = array(
            self::STATUS_REQUEST,
            self::STATUS_RESCHEDULING
        );
        return  ! empty($this->transport_operator) && in_array($this->status, $statuses);
    }

    public function isReschedulable() {
        $statuses = array(
            self::STATUS_ISSUED,
            self::STATUS_RESCHEDULED,
            self::STATUS_REVISION
        );

        return ! empty($this->transport_operator) && in_array($this->status, $statuses);
    }

    public function isIssued() {
        return ! in_array($this->status, array( 
            self::STATUS_REQUEST, 
            self::STATUS_REJECT,
            self::STATUS_EMPTY,
            self::STATUS_RESCHEDULING,
            self::STATUS_REVISION
        ));
    }

    public function hasHistory() {
        return $this->history->count() > 0;
    }

    public function getLastHistory() {
        return ItemHistory::get()
            ->where('trip_item_id = :id:', array('id' => $this->trip_item_id))
            ->orderBy('history_id DESC')
            ->execute()
            ->getFirst();
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        $data['departure_date_short'] = date('d/m/Y', strtotime($data['departure_date']));
        $data['transport_name'] = $data['transport'] == 1 ? 'Air Plane' : 'Train';
        $data['transport_prices_formatted'] = \Micro\Helpers\Number::format($data['transport_prices']);
        $data['has_attachment'] = $this->hasAttachment();
        $data['has_history'] = $this->hasHistory();
        $data['status_name'] = self::getStatusName($this->status);
        $data['is_issued'] = $this->isIssued();
        $data['is_issuable'] = $this->isIssuable();
        $data['is_reschedulable'] = $this->isReschedulable();
        $data['is_downloadable'] = $data['has_attachment'] && $data['is_issued'];
        
        return $data;
    }

    public static function getStatusName($status) {
        if (is_null($status)) {
            return 'Draft';
        }
        
        switch($status) {
            case self::STATUS_REQUEST:
                return 'Request';
            case self::STATUS_ISSUED:
                return 'Issued';
            case self::STATUS_RESCHEDULING:
                return 'Rescheduling';
            case self::STATUS_RESCHEDULED:
                return 'Rescheduled';
            case self::STATUS_CANCELED:
                return 'Canceled';
            case self::STATUS_REJECT:
                return 'Reject';
            case self::STATUS_EMPTY:
                return 'No Ticket';
            case self::STATUS_REVISION:
                return 'Need revision';
            default:
                return 'Draft';
        }
    }

}