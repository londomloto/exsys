<?php
namespace App\Items\Controllers;

use App\Items\Models\ItemForm;

class ItemsFormsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = ItemForm::get();

        if (isset($params['item']) && ! empty($params['item'])) {
            $query->where('item_id = :item:', array('item' => $params['item']));
        }

        return $query->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $post['option'] = ! empty($post['option']) ? json_encode($post['option']) : '';

        $form = new ItemForm();

        if ($form->save($post)) {
            return ItemForm::get($form->item_form_id);
        }

        return ItemForm::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $post['option'] = ! empty($post['option']) ? json_encode($post['option']) : '';
        
        $query = ItemForm::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = ItemForm::get($id);
        if ($query->data) {
            $query->data->delete();
        }
        return array('success' => TRUE);
    }
}