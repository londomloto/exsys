<?php
namespace App\Grades\Controllers;

use App\Grades\Models\Grade;

class GradesController extends \Micro\Controller {

    public function findAction() {
        return Grade::get()->sortable()->filterable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $item = new Grade();

        if ($item->save($post)) {
            return Grade::get($item->grade_id);
        }

        return Grade::none();
    }

    public function updateAction($id) {
        $query = Grade::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Grade::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}