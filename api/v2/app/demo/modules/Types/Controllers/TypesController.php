<?php
namespace App\Types\Controllers;

use App\Types\Models\Type;

class TypesController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;

        switch($display) {
            case 'grid':
                return Type::grid($params);

            case 'tree':
                break;

            case 'travelling':
                return Type::get()
                    ->filterable()
                    ->andWhere('parent_id IS NULL')
                    ->andWhere('type_code = :code:', array('code' => 'travelling'))
                    ->paginate();

            case 'non-travelling':
                return Type::get()
                    ->filterable()
                    ->andWhere('parent_id IS NULL')
                    ->andWhere('type_code <> :code:', array('code' => 'travelling'))
                    ->paginate();

            default:
                return Type::get()
                    ->filterable()
                    ->andWhere('parent_id IS NULL')
                    ->sortable()
                    ->paginate();
        }
    }

    public function createAction() {
        $post = $this->request->getJson();
        $post['parent_id'] = empty($post['parent_id']) ? NULL : $post['parent_id'];
        
        $type = new Type();

        if ($type->save($post)) {
            return Type::get($type->type_id);
        }

        return Type::none();
    }

    public function updateAction($id) {
        $query = Type::get($id);
        $post = $this->request->getJson();
        $post['parent_id'] = empty($post['parent_id']) ? NULL : $post['parent_id'];

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Type::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }
}