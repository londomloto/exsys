<?php
namespace App\Travel\Controllers;

use App\Travel\Models\Travel;

class TravelController extends \Micro\Controller {

    public function findAction() {
        return Travel::get()->paginate();
    }

}