<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Item;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Item::get();
        
        if (isset($params['trip'])) {
            $query->where('id_trip = :trip:', array('trip' => $params['trip']));
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
            return Item::get($data->trip_item_id);
        }
        return Item::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Item::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}