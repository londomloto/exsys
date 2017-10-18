<?php
namespace App\Advance\Models;

class Advance extends \Micro\Model {

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
                'alias' => 'AdvanceType'
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
                'alias' => 'AdvancePurpose'
            )
        );

        $this->hasMany(
            'id_adv',
            'App\Advance\Models\Item',
            'id_adv',
            array(
                'alias' => 'Items'
            )
        );

        $this->hasMany(
            'id_adv',
            'App\Advance\Models\History',
            'id_adv',
            array(
                'alias' => 'History'
            )
        );
    }

    public function getSource() {
        return 'advance_table';
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
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');

        if ($this->lastStatus) {
            $data['status_name'] = $this->lastStatus->status_name;
        }

        if ($this->advanceType) {
            $data['type_name'] = $this->advanceType->type_name;
        }

        if ($this->advancePurpose) {
            $data['purpose_name'] = $this->advancePurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        return $data;
    }

    public function updateAmounts() {
        $amounts = 0;

        foreach($this->items as $elem) {
            $line = $elem->currency_rate * $elem->amounts;
            $amounts += $line;
        }

        $this->amounts = $amounts;
        $this->save();
    }

}