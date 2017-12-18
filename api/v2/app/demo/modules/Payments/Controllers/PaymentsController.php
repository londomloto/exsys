<?php
namespace App\Payments\Controllers;

use App\Payments\Models\Payment;

class PaymentsController extends \Micro\Controller {

    public function findAction() {
        return Payment::get()->paginate();
    }

}