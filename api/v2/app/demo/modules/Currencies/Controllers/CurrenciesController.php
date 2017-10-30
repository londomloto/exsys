<?php
namespace App\Currencies\Controllers;

use App\Currencies\Models\Currency;

class CurrenciesController extends \Micro\Controller {

    public function findAction() {
        return Currency::get()
            ->filterable()
            ->sortable()
            ->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $curr = new Currency();

        if ($curr->save($post)) {
            return Currency::get($curr->currency_id);
        }

        return Currency::none();
    }

    public function updateAction($id) {
        $query = Currency::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Currency::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}