<?php
namespace App\Seeds\Controllers;

use App\Seeds\Models\Seed;

class SeedsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;
        
        switch($display) {
            case 'combo':   
                return Seed::combo();
            default:
                return Seed::get()
                    ->filterable()
                    ->andWhere('parent_id IS NOT NULL')
                    ->sortable()
                    ->paginate();
        }
    }

}