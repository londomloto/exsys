<?php
namespace App\Seeds\Models;

class Seed extends \Micro\Model {

    public function getSource() {
        return 'master_seed';
    }

    public function isParent() {
        return empty($this->parent_id);
    }

}