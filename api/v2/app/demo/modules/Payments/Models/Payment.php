<?php
namespace App\Payments\Models;

class Payment extends \Micro\Model {

    public function getSource() {
        return 'master_payment';
    }

}