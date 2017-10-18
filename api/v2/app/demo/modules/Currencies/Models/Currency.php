<?php
namespace App\Currencies\Models;

class Currency extends \Micro\Model {

    public function getSource() {
        return 'master_currency';
    }
    
    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['currency_rate_formatted'] = number_format($this->currency_rate, 2, ',', '.');
        return $data;
    }
}