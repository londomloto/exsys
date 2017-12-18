<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Item,
    App\Advance\Models\ItemHistory;

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
        $user = $this->auth->user();
        $post = $this->request->getJson();
        $post['created_by'] = $user['su_id'];
        $post['created_date'] = date('Y-m-d H:i:s');

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
        $user = $this->auth->user();
        $post = $this->request->getJson();
        $post['updated_date'] = date('Y-m-d H:i:s');
        $post['updated_by'] = $user['su_id'];

        $query = Item::get($id);

        if ($query->data) {

            $params = $this->request->getParams();
            $action = isset($params['action']) ? $params['action'] : FALSE;

            if ($action == 'revision') {
                $copy = $query->data->toArray();
                $copy['history_date'] = date('Y-m-d H:i:s');
            }

            if ($query->data->save($post)) {

                if ($action == 'revision') {
                    $hist = new ItemHistory();
                    $hist->save($copy); // logs old data
                }

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

    public function historyByIdAction($id) {
        $history = ItemHistory::get()
            ->where('advance_item_id = :id:', array('id' => $id))
            ->orderBy('history_id DESC') 
            ->execute()
            ->filter(function($item){ 
                return $item->toArray();
            });

        if (count($history) > 0) {
            $item = Item::get($id)->data;
            if ($item) {
                array_unshift($history, $item->toArray());
            }
        }

        return array(
            'success' => TRUE,
            'data' => $history
        );
    }

}