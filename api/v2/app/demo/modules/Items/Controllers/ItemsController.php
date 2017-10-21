<?php
namespace App\Items\Controllers;

use App\Items\Models\Item;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;

        switch($display) {
            case 'combo':
            case 'grid':
                return Item::combo();
            case 'parent':
                return Item::get()->where('parent_id IS NULL')->paginate();
            default:
                return Item::get()->paginate();
        }
    }

    public function findByIdAction($id) {
        return Item::get($id);
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Item();

        if ($data->save($post)) {
            return Item::get($data->item_id);
        }

        return Item::none();
    }

    public function updateAction($id) {
        $query = Item::get($id);
        $post = $this->request->getJson();

        if (empty($post['parent_id'])) {
            $post['parent_id'] = NULL;
        }

        if ($query->data) {
            $query->data->save($post);
        }
        return $query;
    }
}