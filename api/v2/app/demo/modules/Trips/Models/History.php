<?php
namespace App\Trips\Models;

class History extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'user_act',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );

        $this->hasOne(
            'status_id',
            'App\Statuses\Models\Status',
            'status_id',
            array(
                'alias' => 'Status'
            )
        );
    }

    public function getSource() {
        return 'trip_history';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['user_act_name'] = '';
        $data['status_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));

        if ($this->user) {
            $data['user_act_name'] = $this->user->su_fullname;
        }

        if ($this->status) {
            $data['status_name'] = $this->status->status_name;
        }

        return $data;
    }

    public static function log($type, $trip, $notes = '') {
        $user = \Micro\App::getDefault()->auth->user();

        // log history
        $data = new History();
        
        $data->id_trip = $trip->id_trip;
        $data->status_id = $trip->status;
        $data->user_act = $user['su_id'];
        $data->date = date('Y-m-d H:i:s');
        $data->notes = $notes;

        $data->save();
    }
}