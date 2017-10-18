<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Item;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Item::get();
        
        if (isset($params['advance'])) {
            $query->where('id_adv = :advance:', array('advance' => $params['advance']));
        }

        return $query->paginate();
    }

    public function findByIdAction($id) {
        return Item::get($id);
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Item();
        if ($data->save($post)) {
            if ($data->advance) {
                $data->advance->updateAmounts();
            }

            return Item::get($data->advance_item_id);
        }
        return Item::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Item::get($id);

        if ($query->data) {
            if ($query->data->save($post)) {
                if ($query->data->advance) {
                    $query->data->advance->updateAmounts();
                }
            }
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            $advance = $query->data->advance;
            if ($query->data->delete()) {
                if ($advance) {
                    $advance->updateAmounts();
                }
            }
        }

        return array('success' => TRUE);
    }

}