<?php
namespace App\Currencies\Models;

class Currency extends \Micro\Model {

    public function getSource() {
        return 'master_currency';
    }
    
    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['currency_display'] = $this->currency_name.' ('.$this->currency_code.')';
        $data['currency_rate_formatted'] = number_format($this->currency_rate, 2, ',', '.');
        return $data;
    }

    public static function offset() {
        return self::findFirst(array(
            'currency_code = :code:',
            'bind' => array(
                'code' => 'IDR'
            )
        ));
    }
}