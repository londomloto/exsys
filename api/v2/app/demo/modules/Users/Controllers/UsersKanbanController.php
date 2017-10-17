<?php
namespace App\Users\Controllers;

use App\Users\Models\UserKanban,
    App\Users\Models\User,
    App\Roles\Models\Role,
    App\Roles\Models\RoleKanban,
    App\Kanban\Models\KanbanSetting;

class UsersKanbanController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : NULL;

        switch($display) {
            case 'setup':

                $user = (isset($params['user']) && ! empty($params['user'])) ? $params['user'] : -1;

                $query = KanbanSetting::get()
                    ->columns("
                        a.suk_id,
                        ks_id AS suk_ks_id,
                        ks_name As suk_ks_name,
                        ks_description As suk_ks_description,
                        IFNULL(a.suk_selected, 0) as suk_selected,
                        'user' AS suk_source
                    ");

                $query->join('App\Users\Models\UserKanban', 'a.suk_ks_id = ks_id AND a.suk_su_id = ' . $user, 'a', 'left');

                $kanban = $query->execute()->toArray();
                $exists = UserKanban::get()->where('suk_su_id = :user:', array('user' => $user))->execute();

                if (count($exists) == 0) {
                    if (isset($params['role'])) {
                        $role = Role::get($params['role'])->data;
                        if ($role) {
                            $select = array_map(function($k){ return $k['srk_ks_id']; }, $role->kanban->toArray());
                            if (count($select) > 0) {
                                foreach($kanban as &$k) {
                                    $k['suk_source'] = 'role';
                                    if (in_array($k['suk_ks_id'], $select)) {
                                        $k['suk_selected'] = 1;
                                    }
                                }
                            }
                        }
                    }
                }

                return array(
                    'success' => TRUE,
                    'data' => $kanban
                );

            default:

                $data = array();

                if (isset($params['user']) && ! empty($params['user'])) {
                    $data = UserKanban::get()
                        ->columns(array(
                            'ks_id',
                            'ks_name',
                            'ks_description'
                        ))
                        ->join('App\Kanban\Models\KanbanSetting', 'suk_ks_id = ks_id', NULL, 'left')
                        ->where('suk_selected = 1 AND suk_su_id = :user:', array('user' => $params['user']))
                        ->execute()
                        ->toArray();

                    if (count($data) === 0) {
                        // try grab from role
                        $user = User::findFirst($params['user']);
                        if ($user && ($role = $user->role)) {
                            $data = RoleKanban::get()
                                ->columns(array(
                                    'ks_id',
                                    'ks_name',
                                    'ks_description'
                                ))
                                ->join('App\Kanban\Models\KanbanSetting', 'srk_ks_id = ks_id', NULL, 'left')
                                ->where('srk_sr_id = :role:', array('role' => $role->sr_id))
                                ->execute()
                                ->toArray();
                        }
                    }

                }

                return array(
                    'success' => TRUE,
                    'data' => $data
                );

        }
    }

}