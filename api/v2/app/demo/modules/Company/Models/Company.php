<?php
namespace App\Company\Models;

class Company extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'com_currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'Currency'
            )
        );
    }

    public function getSource() {
        return 'company';
    }

    public static function getCurrencyRate() {
        static $rate;

        if (is_null($rate)) {
            $company = self::findFirst(1);
            
            if ($company && $company->currency) {
                $rate = $company->currency->currency_rate;
            } else {
                $rate = 1;
            }
        }

        return $rate;
    }

}