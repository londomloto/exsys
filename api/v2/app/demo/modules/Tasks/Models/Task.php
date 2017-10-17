<?php
namespace App\Tasks\Models;

class Task extends \Micro\Model {

    public function getSource() {
        return 'trx_tasks';
    }
}