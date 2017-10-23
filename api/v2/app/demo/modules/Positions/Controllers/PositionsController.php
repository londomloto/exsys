<?php
namespace App\Positions\Controllers;

use App\Positions\Models\Position;

class PositionsController extends \Micro\Controller {

    public function findAction() {
        return Position::get()->sortable()->paginate();
    }

}