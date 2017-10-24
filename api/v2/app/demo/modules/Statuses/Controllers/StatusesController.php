<?php
namespace App\Statuses\Controllers;

use App\Statuses\Models\Status,
    Micro\Helpers\Text;

class StatusesController extends \Micro\Controller {

    public function findAction() {
        return Status::get()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $post['status_code'] = Text::slug($post['status_name']);

        $stat = new Status();

        if ($stat->save($post)) {
            return Status::get($stat->status_id);
        }

        return Status::none();
    }

    public function updateAction($id) {
        $query = Status::get($id);
        $post = $this->request->getJson();
        $post['status_code'] = Text::slug($post['status_name']);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Status::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }
}