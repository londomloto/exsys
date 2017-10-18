<?php
namespace App\Advance\Models;

class Item extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'Currency'
            )
        );

        $this->belongsTo(
            'id_adv',
            'App\Advance\Models\Advance',
            'id_adv',
            array(
                'alias' => 'Advance'
            )
        );
    }

    public function getSource() {
        return 'advance_item';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['amounts_formatted'] = number_format($this->amounts, 2, ',', '.');
        $data['currency_name'] = '';

        if ($this->currency) {
            $data['currency_name'] = $this->currency->currency_code;
        }

        return $data;
    }

}