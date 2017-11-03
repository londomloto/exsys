<?php
namespace App\Seeds\Controllers;

use App\Seeds\Models\Seed;

class SeedsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;
        
        switch($display) {
            case 'combo': 
            case 'grid':
                return Seed::combo();
            case 'parent':
                return Seed::get()
                    ->filterable() 
                    ->andWhere('parent_id = 0')
                    ->sortable()
                    ->paginate();

            default:
                return Seed::get()
                    ->filterable()
                    ->andWhere('parent_id IS NOT NULL')
                    ->sortable()
                    ->paginate();
        }
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Seed();

        if ($data->save($post)) {
            return Seed::get($data->seed_id);
        }

        return Seed::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Seed::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Seed::get($id);
        if ($query->data) {
            // relocate children
            $children = Seed::find(array(
                'parent_id = :parent:',
                'bind' => array('parent' => $query->data->seed_id)
            ))->filter(function($item){ return $item; });

            if ($query->data->delete()) {
                foreach($children as $item) {
                    $item->delete();
                }
            }
        }
        return array('success' => TRUE);
    }

}