<?php
namespace App\Types\Controllers;

use App\Types\Models\Type;

class PurposesController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : NULL;

        switch($display) {
            case 'travelling':
                return Type::get()
                    ->join('App\Types\Models\Type', 'p.type_id = App\Types\Models\Type.parent_id', 'p')
                    ->andWhere('p.type_code = :code:', array('code' => 'travelling'))
                    ->andWhere('App\Types\Models\Type.parent_id IS NOT NULL')
                    ->paginate();

            case 'non-travelling':
                return Type::get()
                    ->join('App\Types\Models\Type', 'p.type_id = App\Types\Models\Type.parent_id', 'p')
                    ->andWhere('p.type_code <> :code:', array('code' => 'travelling'))
                    ->andWhere('App\Types\Models\Type.parent_id IS NOT NULL')
                    ->paginate();

            default:
                return Type::get()
                    ->filterable() 
                    ->andWhere('parent_id IS NOT NULL')
                    ->sortable()
                    ->paginate();
        }
    }

}