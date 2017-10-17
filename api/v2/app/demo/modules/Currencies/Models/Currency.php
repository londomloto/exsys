<?php
namespace App\Currencies\Models;

class Currency extends \Micro\Model {

    public function getSource() {
        return 'master_currency';
    }
    
}