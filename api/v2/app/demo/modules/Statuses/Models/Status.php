<?php
namespace App\Statuses\Models;

class Status extends \Micro\Model {

    public function getSource() {
        return 'master_status';
    }

}