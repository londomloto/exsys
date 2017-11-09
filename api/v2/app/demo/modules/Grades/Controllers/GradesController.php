<?php
namespace App\Grades\Controllers;

use App\Grades\Models\Grade;

class GradesController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();

        if (isset($params['fields']) && ! empty($params['fields'])) {
            $fields = json_decode($params['fields']);

            $fields = array_map(function($e){
                return $e == 'grade_label' ? 'grade_code' : $e;
            }, $fields);

            if ( ! in_array('grade_name', $fields)) {
                $fields[] = 'grade_name';
            }

            $_REQUEST['fields'] = json_encode($fields);
        }
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