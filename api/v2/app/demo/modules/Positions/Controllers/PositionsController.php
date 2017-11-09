<?php
namespace App\Positions\Controllers;

use App\Positions\Models\Position;

class PositionsController extends \Micro\Controller {

    public function findAction() {
        return Position::get()->filterable()->sortable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Position();

        if ($data->save($post)) {
            return Position::get($data->pos_id);
        }

        return Position::none();
    }

    public function updateAction($id) {
        $query = Position::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Position::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}