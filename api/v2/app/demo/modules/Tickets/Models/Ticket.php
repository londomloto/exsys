<?php
namespace App\Tickets\Models;

class Ticket extends \Micro\Model {

    public function getSource() {
        return 'tickets';
    }

}