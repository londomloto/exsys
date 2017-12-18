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
                return Item::tree();
            case 'parent':
                return Item::get()->where('parent_id = 0')->filterable()->sortable()->paginate();
            default:
                return Item::get()->filterable()->sortable()->paginate();
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
            $post['parent_id'] = 0;
        }

        if ($query->data) {
            $query->data->save($post);
        }
        return $query;
    }
}