<?php
namespace App\Organization\Controllers;

use App\Organization\Models\Organization;

class OrganizationController extends \Micro\Controller {

    public function findAction() {
        return Organization::get()->sortable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Organization();

        if ($data->save($post)) {
            return Organization::get($data->org_id);
        }

        return Organization::none();
    }

    public function updateAction($id) {
        $query = Organization::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Organization::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

}