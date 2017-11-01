<?php
namespace App\Seeds\Controllers;

use App\Seeds\Models\Seed;

class TypesController extends \Micro\Controller {

    public function findAction() {
        
        return Seed::get()
            ->filterable()
            ->andWhere('parent_id IS NULL')
            ->sortable()
            ->paginate();

    }

}