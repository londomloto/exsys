<?php
namespace App\Roles\Models;

class RoleUser extends \Micro\Model {

    public function initialize() {
        $this->belongsTo(
            'sru_sr_id',
            'App\Roles\Models\Role',
            'sr_id',
            array(
                'alias' => 'Role'
            )
        );

        $this->belongsTo(
            'sru_su_id',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );
    }

    public function getSource() {
        return 'sys_roles_users';
    }

}