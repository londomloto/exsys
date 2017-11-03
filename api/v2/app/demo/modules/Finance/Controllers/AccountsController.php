<?php
namespace App\Finance\Controllers;

use App\Finance\Models\Account;

class AccountsController extends \Micro\Controller {

    public function findAction() {
        return Account::get()->filterable()->sortable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Account();

        if ($data->save($post)) {
            return Account::get($data->acc_id);
        }

        return Account::none();
    }

    public function updateAction($id) {
        $query = Account::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Account::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array(
            'success' => TRUE
        );
    }

}