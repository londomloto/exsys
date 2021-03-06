<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Exchange;

class ExchangesController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Exchange::get();

        if (isset($params['expense'])) {
            $query->where('id_exp = :expense:', array('expense' => $params['expense']));
        }

        return $query->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Exchange();

        if ($data->save($post)) {
            return Exchange::get($data->exp_exchange_id);
        }

        return Exchange::none();
    }

    public function updateAction($id) {
        $query = Exchange::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            if ($query->data->save($post)) {
                foreach($query->data->expenseItems as $item) {
                    $item->currency_rate_exchanged = $query->data->rates;
                    $item->currency_offset_rate = $query->data->rates;
                    $item->save();
                }
            }
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Exchange::get($id);
        if ($query->data) {
            $query->data->delete();
        }
        return array('success' => TRUE);
    }

}