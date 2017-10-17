<?php
namespace App\Roles\Controllers;

use App\Roles\Models\Role,
    App\Roles\Models\RoleKanban,
    App\Kanban\Models\KanbanSetting;

class RolesKanbanController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : NULL;

        switch($display) {
            case 'setup':

                $query = KanbanSetting::get()
                    ->columns("
                        a.srk_id,
                        ks_id AS srk_ks_id,
                        ks_name AS srk_ks_name,
                        ks_description As srk_ks_description,
                        IFNULL(a.srk_selected, 0) AS srk_selected
                    ");

                $role = (isset($params['role']) && ! empty($params['role'])) ? $params['role'] : -1;
                $query->join('App\Roles\Models\RoleKanban', 'ks_id = a.srk_ks_id AND a.srk_sr_id = '.$role, 'a', 'left');
                
                $data = $query->execute();

                return array(
                    'success' => TRUE,
                    'data' => $data
                );

            default:
                return RoleKanban::get()->paginate();
        }
        
    }

}