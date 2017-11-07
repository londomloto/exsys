<?php
namespace App\Advance\Models;

class Refund extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'Currency'
            )
        );
    }

    public function getSource() {
        return 'advance_refund';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['date_formatted'] = date('d/m/Y', strtotime($this->date));
        $data['amounts_formatted'] = number_format($this->amounts, 2, ',', '.');
        $data['has_attachment'] = FALSE;

        if ( ! empty($this->attachment)) {
            $file = APPPATH.'public/resources/attachments/'.$this->attachment;
            
            if (file_exists($file)) {
                $data['has_attachment'] = TRUE;
            }
        }

        if ($this->currency) {
            $data['currency_code'] = $this->currency->currency_code;
        }

        return $data;
    }

}