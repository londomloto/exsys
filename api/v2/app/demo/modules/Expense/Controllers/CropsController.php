<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Crop,
    App\Expense\Models\Expense;

class CropsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;

        switch($display) {
            case 'group':

                if (isset($params['expense'])) {
                    $expense = Expense::get($params['expense'])->data;

                    return array(
                        'success' => TRUE,
                        'data' => $expense->getGroupedCrops()
                    );
                } else {
                    return array(
                        'success' => TRUE,
                        'data' => array()
                    );
                }

            default:
                $query = Crop::get();

                if (isset($params['expense'])) {
                    $query->where('id_exp = :expense:', array('expense' => $params['expense']));
                }

                return $query->paginate();
        }
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