<?php
namespace App\Costs\Models;

class Cost extends \Micro\Model {

    public function getSource() {
        return 'master_cnb';
    }

}