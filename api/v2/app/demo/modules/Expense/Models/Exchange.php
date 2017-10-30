<?php
namespace App\Expense\Models;

class Exchange extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'from_currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'From'
            )
        );

        $this->hasOne(
            'to_currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'To'
            )
        );
    }

    public function getSource() {
        return 'expense_exchange';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['exchange_date_short'] = date('d/m/Y', strtotime($this->exchange_date));
        $data['from_display'] = '';
        $data['to_display'] = '';

        if ($this->from) {
            $data['from_display'] = '('.$this->from->currency_code.') '.number_format($this->from_amounts, 2, '.', ',');
        }

        if ($this->to) {
            $data['to_display'] = '('.$this->to->currency_code.') '.number_format($this->to_amounts, 2, '.', ',');
        }

        return $data;
    }
}