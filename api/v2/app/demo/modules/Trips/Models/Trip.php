<?php
namespace App\Trips\Models;

class Trip extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'status',
            'App\Statuses\Models\Status',
            'status_id',
            array(
                'alias' => 'LastStatus'
            )
        );

        $this->hasOne(
            'type',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'TripType'
            )
        );

        $this->hasOne(
            'id_user',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );

        $this->hasOne(
            'purpose',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'TripPurpose'
            )
        );

        $this->hasMany(
            'id_trip',
            'App\Trips\Models\Item',
            'id_trip',
            array(
                'alias' => 'Items'
            )
        );

        $this->hasMany(
            'id_trip',
            'App\Trips\Models\History',
            'id_trip',
            array(
                'alias' => 'History'
            )
        );

        $this->hasOne(
            'adv_ref',
            'App\Advance\Models\Advance',
            'id_adv',
            array(
                'alias' => 'Advance'
            )
        );
    }

    public function getSource() {
        return 'trip_table';
    }

    public function getAmounts() {
        $amounts = 0;

        if ($this->advance) {
            $amounts = $this->advance->amounts;
        }
        return $amounts;
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['status_name'] = '';
        $data['type_name'] = '';
        $data['purpose_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));
        $data['date_start_short'] = date('d/m/Y', strtotime($this->date_start));
        $data['date_end_short'] = date('d/m/Y', strtotime($this->date_end));
        $data['has_items'] = $this->items->count() > 0 ? 1 : 0;
        

        if ($this->lastStatus) {
            $data['status_name'] = $this->lastStatus->status_name;
        }

        if ($this->tripType) {
            $data['type_name'] = $this->tripType->type_name;
        }

        if ($this->tripPurpose) {
            $data['purpose_name'] = $this->tripPurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        if ($this->advance) {
            $data['amounts'] = $this->advance->amounts;
            $data['adv_no'] = $this->advance->adv_no;
            $data['adv_subject'] = $this->advance->subject_adv;
            $data['adv_desc'] = $this->advance->adv_no.' ('. $this->advance->subject_adv .')';
        }
        
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');

        return $data;
    }

}