<?php
namespace App\Company\Controllers;

use App\Company\Models\Company;

class CompanyController extends \Micro\Controller {

    public function findByIdAction($id) {
        return Company::get($id);
    }

    public function updateAction($id) {
        $query = Company::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }
        return $query;
    }

}