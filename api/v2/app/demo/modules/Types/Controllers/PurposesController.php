<?php
namespace App\Types\Controllers;

use App\Types\Models\Type;

class PurposesController extends \Micro\Controller {

    public function findAction() {
        return Type::get()
            ->where('parent_id IS NOT NULL')
            ->sortable()
            ->paginate();
    }

}