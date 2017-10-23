<?php
namespace App\Organization\Controllers;

use App\Organization\Models\OrganizationType;

class OrganizationTypesController extends \Micro\Controller {

    public function findAction() {
        return OrganizationType::get()->sortable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new OrganizationType();

        if ($data->save($post)) {
            return OrganizationType::get($data->pos_id);
        }

        return OrganizationType::none();
    }

    public function updateAction($id) {
        $query = OrganizationType::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = OrganizationType::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}