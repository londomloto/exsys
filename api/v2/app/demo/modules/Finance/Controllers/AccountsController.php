<?php
namespace App\Finance\Controllers;

use App\Finance\Models\Account;

class AccountsController extends \Micro\Controller {

    public function findAction() {
        return Account::get()->filterable()->sortable()->paginate();
    }

}