<?php
namespace App\Advance\Models;

class ItemHistory extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'Currency'
            )
        );

        $this->hasOne(
            'created_by',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'Creator'
            )
        );

        $this->hasOne(
            'updated_by',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'Updater'
            )
        );
    }

    public function getSource() {
        return 'advance_item_history';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        $data['amounts_formatted'] = number_format($this->amounts, 2, ',', '.');
        $data['currency_name'] = '';
        $data['currency_code'] = '';

        if ($this->currency) {
            $data['currency_code'] = $this->currency->currency_code;
            $data['currency_name'] = $this->currency->currency_name;
        }

        $data['log'] = '';

        if (empty($this->updated_date)) {
            $data['log'] = 'Created by '.($this->creator ? $this->creator->su_fullname : 'NULL').' at '.date('F d, Y H:i', strtotime($this->created_date));
        } else {
            $data['log'] = 'Updated by '.($this->updater ? $this->updater->su_fullname : 'NULL').' at '.date('F d, Y H:i', strtotime($this->updated_date));
        }

        return $data;
    }

}