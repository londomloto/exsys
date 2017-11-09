<?php
namespace App\Costs\Controllers;

use App\Costs\Models\Cost;

class CostsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;
        $query = Cost::get()->filterable()->sortable();

        switch($display) {
            case 'grade':
                $query->andWhere('grade_id IS NOT NULL');
                break;
            case 'location':
                $query->andWhere('location_id IS NOT NULL');
                break;
            case 'position':
                $query->andWhere('position_id IS NOT NULL');
                break;
        }

        return $query->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $post['grade_id'] = $post['grade_id'] == '' ? NULL :$post['grade_id'];
        $post['position_id'] = $post['position_id'] == '' ? NULL :$post['position_id'];
        $post['location_id'] = $post['location_id'] == '' ? NULL :$post['location_id'];
        $data = NULL;

        if ( ! empty($post['grade_id'])) {
            $data = Cost::findFirst(array(
                'item_id = :item: AND grade_id = :grade:',
                'bind' => array(
                    'item' => $post['item_id'],
                    'grade' => $post['grade_id']
                )
            ));
        }

        if ( ! empty($post['position_id'])) {
            $data = Cost::findFirst(array(
                'item_id = :item: AND position_id = :position:',
                'bind' => array(
                    'item' => $post['item_id'],
                    'position' => $post['position_id']
                )
            ));
        }

        if ($data) {
            return array(
                'success' => FALSE,
                'message' => 'Item already exists'
            );
        }

        $data = new Cost();

        if ($data->save($post)) {
            return Cost::get($data->cnb_id);
        }

        return Cost::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $post['grade_id'] = $post['grade_id'] == '' ? NULL :$post['grade_id'];
        $post['position_id'] = $post['position_id'] == '' ? NULL :$post['position_id'];
        $post['location_id'] = $post['location_id'] == '' ? NULL :$post['location_id'];
        
        $query = Cost::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Cost::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array(
            'success' => TRUE
        );
    }
    
}