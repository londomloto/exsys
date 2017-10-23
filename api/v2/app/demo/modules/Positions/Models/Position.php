<?php
namespace App\Positions\Models;

class Position extends \Micro\Model {

    public function getSource() {
        return 'master_position';
    }

}