<?php
namespace App\Grades\Controllers;

use App\Grades\Models\Grade;

class GradesController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Grade::get()->filterable()->sortable();

        if (isset($params['fields'], $params['query']) && ! empty($params['query'])) {
            $fields = json_decode($params['fields']);
            if ( ! in_array('grade_id', $fields)) {
                $query->andWhere(
                    "(
                        grade_code LIKE :code: 
                        OR grade_desc LIKE :desc: 
                        OR (IF(verificator = 1, 'verificator', '') LIKE :type:) 
                        OR (IF(approver = 1, 'approver', '') LIKE :type:) 
                        OR (IF(verificator = 0 AND approver = 0, 'creator', '') LIKE :type:)
                    )", 
                    array(
                        'code' => '%'.$params['query'].'%',
                        'desc' => '%'.$params['query'].'%',
                        'type' => '%'.$params['query'].'%'
                    )
                );
            }
        }

        return $query->paginate();
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