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

    public function hasAttachment() {
        $attachment = $this->getAttachment();
        if ( ! empty($attachment)) {
            return file_exists($attachment);
        }
        return FALSE;
    }
    
    public function getAttachment() {
        if ( ! empty($this->attachment)) {
            return APPPATH.'public/resources/attachments/'.$this->attachment;    
        }
        return '';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['date_formatted'] = date('d/m/Y', strtotime($this->date));
        $data['amounts_formatted'] = \Micro\Helpers\Number::format($this->amounts, 2, 'accounting');
        $data['has_attachment'] = $this->hasAttachment();

        if ($this->currency) {
            $data['currency_code'] = $this->currency->currency_code;
        }

        return $data;
    }

}