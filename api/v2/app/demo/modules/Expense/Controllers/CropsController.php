<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Crop;

class CropsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Crop::get();

        if (isset($params['expense'])) {
            $query->where('id_exp = :expense:', array('expense' => $params['expense']));
        }

        return $query->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Crop();

        if ($data->save($post)) {
            return Crop::get($data->exp_crop_id);
        }

        return Crop::none();
    }

    public function updateAction($id) {
        $query = Crop::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Crop::get($id);
        if ($query->data) {
            $query->data->delete();
        }
        return array('success' => TRUE);
    }

}