<?php
namespace App\Users\Models;

use App\Users\Models\UserMenu,
    App\Users\Models\UserPermission,
    App\Roles\Models\RoleUser,
    Phalcon\Mvc\Model\Relation;

class User extends \Micro\Model {
    
    const AVATAR_DEFAULT = 'defaults/avatar-0.jpg';
    const MAX_LIMIT = 15000000;

    public function initialize() {

        $this->hasMany(
            'su_id',
            'App\Users\Models\UserKanban',
            'suk_su_id',
            array(
                'alias' => 'Kanban',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasMany(
            'su_id',
            'App\Users\Models\UserPermission',
            'sup_su_id',
            array(
                'alias' => 'UserPermissions',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasManyToMany(
            'su_id',
            'App\Users\Models\UserPermission',
            'sup_su_id',
            'sup_smc_id',
            'App\Modules\Models\ModuleCapability',
            'smc_id',
            array(
                'alias' => 'Permissions'
            )
        );

        $this->hasMany(
            'su_id',
            'App\Users\Models\UserMenu',
            'sum_su_id',
            array(
                'alias' => 'UserMenus'
            )
        );

        $this->hasManyToMany(
            'su_id',
            'App\Users\Models\UserMenu',
            'sum_su_id',
            'sum_smn_id',
            'App\Menus\Models\Menu',
            'smn_id',
            array(
                'alias' => 'Menus'
            )
        );

        $this->hasOne(
            'su_superior',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'Superior'
            )
        );

        $this->hasOne(
            'su_position_id',
            'App\Positions\Models\Position',
            'pos_id',
            array(
                'alias' => 'Position'
            )
        );

        $this->hasOne(
            'su_grade_id',
            'App\Grades\Models\Grade',
            'grade_id',
            array(
                'alias' => 'Grade'
            )
        );

        $this->hasMany(
            'su_id',
            'App\Roles\Models\RoleUser',
            'sru_su_id',
            array(
                'alias' => 'RoleUsers'
            )
        );

        $this->hasManyToMany(
            'su_id',
            'App\Roles\Models\RoleUser',
            'sru_su_id',
            'sru_sr_id',
            'App\Roles\Models\Role',
            'sr_id',
            array(
                'alias' => 'Roles'
            )
        );

    }

    public function getSource() {
        return 'sys_users';
    }

    // @Override
    public function toArray($columns =  NULL) {
        $array = parent::toArray($columns);

        // handle avatar
        $avatar = PUBPATH.'resources/avatars/'.$array['su_avatar'];
        $exists = file_exists($avatar) && ! is_dir($avatar);

        if ( ! $exists) {
            $array['su_avatar'] = self::AVATAR_DEFAULT;
        }

        $URL = $this->getDI()->get('url');

        $array['su_avatar_url'] = $URL->getBaseUrl().'public/resources/avatars/'.$array['su_avatar'];
        $array['su_avatar_thumb'] = $URL->getSiteUrl('assets/thumb?s=public/resources/avatars/'.$array['su_avatar']);

        // handle password
        unset($array['su_passwd']);    

        // if ($this->role) {
        //     $array = array_merge($array, $this->role->toArray());
        // }

        $array['su_roles'] = $this->roles->filter(function($role){
            return array(
                'sr_id' => $role->sr_id,
                'sr_name' => $role->sr_name,
                'sr_description' => $role->sr_description
            );
        });

        $array['su_position_name'] = '';

        if ($this->position) {
            $array['su_position_name'] = $this->position->pos_name;
        }

        $array['su_grade_limit'] = 0;
        $array['su_grade_code'] = '';
        $array['su_grade_type'] = '';
        $array['su_grade_label'] = '';

        if ($this->grade) {
            $grade = $this->grade->toArray();

            $array['su_grade_code']  = $grade['grade_code'];
            $array['su_grade_label'] = $grade['grade_label'];
            $array['su_grade_limit'] = $grade['grade_limit'];

            if ($grade['approver'] == 1) {
                $array['su_grade_type'] = 'approver';
            } else if ($grade['verificator'] == 1) {
                $array['su_grade_type'] = 'verificator';
            }
        }

        $array['su_superior_fullname'] = '';
        $array['su_superior_gradel_label'] = '';

        if ($this->superior) {
            $array['su_superior_fullname'] = $this->superior->su_fullname;

            if ($this->superior->grade) {
                $grade = $this->superior->grade->toArray();
                $array['su_superior_gradel_label'] = $grade['grade_label'];
            }
        }

        return $array;
    }

    public function getSuperiors($amounts = 0) {
        $supers = array();
        $min = 0;
        $max = 0;
        
        if ($this->grade) {
            $min = $this->grade->grade_limit;
        }
        
        if ($this->superior && $this->superior->grade) {
            $max = $this->superior->grade->grade_limit;
        }

        self::__getSuperiors($this, $amounts, $min, $max, $supers);
        return $supers;
    }

    private static function __getSuperiors($user, $amounts = 0, $min = 0, $max = 0, &$stack) {
        $loop = true;
        $userGrade = $user->grade;

        if ($userGrade && $user->superior) {
            $superGrade = $user->superior->grade;
            if ($superGrade) {

                if ($superGrade->verificator == 1) {
                    $stack[] = array(
                        'user_id' => $user->superior->su_id,
                        'user_fullname' => $user->superior->su_fullname,
                        'user_email' => $user->superior->su_email,
                        'grade_id' => $superGrade->grade_id,
                        'grade_type' => 'verificator',
                        'grade_limit' => $superGrade->grade_limit 
                    );
                } else if($superGrade->approver == 1) {
                    if ($amounts >= $max) {
                        $stack[] = array(
                            'user_id' => $user->superior->su_id,
                            'user_fullname' => $user->superior->su_fullname,
                            'user_email' => $user->superior->su_email,
                            'grade_id' => $superGrade->grade_id,
                            'grade_type' => 'approver',
                            'grade_limit' => $superGrade->grade_limit 
                        );

                        if ($max == self::MAX_LIMIT) {
                            $loop = false;
                        }
                    } else if ($amounts >= $min && $amounts <= $max) {
                        $stack[] = array(
                            'user_id' => $user->superior->su_id,
                            'user_fullname' => $user->superior->su_fullname,
                            'user_email' => $user->superior->su_email,
                            'grade_id' => $superGrade->grade_id,
                            'grade_type' => 'approver',
                            'grade_limit' => $superGrade->grade_limit 
                        );

                        if ($max == self::MAX_LIMIT) {
                            $loop = false;
                        }
                    }
                }
            }
            
        } else {
            $loop = false;
        }

        if ($loop) {
            if ($user->superior->grade) {
                $min = $user->superior->grade->grade_limit;

                if ($user->superior->superior && $user->superior->superior->grade) {
                    $max = $user->superior->superior->grade->grade_limit;
                }
            }

            self::__getSuperiors($user->superior, $amounts, $min, $max, $stack);
        }
    }

    public function getMenus($options = array()) {
        if ($this->userMenus->count() == 0) {
            $menus = array();
            foreach($this->roles as $role) {
                foreach($role->getMenus($options) as $menu) {
                    if ( ! isset($menus[$menu->smn_id])) {
                        $menus[$menu->smn_id] = $menu;
                    }
                }
            }
            return array_values($menus);
            /*if ($this->role) {
                return $this->role->getMenus();
            } else {
                return \App\Menus\Models\Menu::find('smn_id = -1');
            }*/
        } else {
            $conditions = '';

            if (isset($options[0]) && is_string($options[0])) {
                $conditions = $options[0];
                unset($options[0]);
            } else if (isset($options['conditions'])) {
                $conditions = $options['conditions'];
                unset($options['conditions']);
            }

            if ( ! empty($conditions)) {
                $conditions .= ' AND ';
            }
            
            $conditions .= 'App\Users\Models\UserMenu.sum_selected = 1';
            $options['conditions'] = $conditions;

            return parent::getMenus($options);
        }
    }

    public function getPermissions($options = array()) {
        if ($this->userPermissions->count() == 0) {
            $perms = array();
            foreach($this->roles as $role) {
                foreach($role->getPermissions() as $perm) {
                    if ( ! isset($perms[$perm->smc_id])) {
                        $perms[$perm->smc_id] = $perm;
                    }
                }
            }
            return array_values($perms);
            // if ($this->role) {
            //     return $this->role->getPermissions();
            // } else {
            //     return \App\Modules\Models\ModuleCapability::find('smc_id = -1');
            // }
        } else {
            $conditions = '';

            if (isset($options[0]) && is_string($options[0])) {
                $conditions .= ' AND ' . $options[0];
                unset($options[0]);
            } else if (isset($options['conditions'])) {
                $conditions = ' AND ' . $options['conditions'];
                unset($options['conditions']);
            }

            if ( ! empty($conditions)) {
                $conditions .= ' AND ';
            }

            $conditions .= 'App\Users\Models\UserPermission.sup_selected = 1';
            $options['conditions'] = $conditions;
        }

        return parent::getPermissions($options);
    }

    // @Override
    public static function findFirstByEmail($email) {
        return self::get()
            ->where('su_email = :email:', array('email' => $email))
            ->execute()
            ->getFirst();
    }

    public function saveKanban($items) {

        if (count($items) === 0) {
            // reset
            $this->kanban->delete();
            return;
        }

        $create = array();
        $update = array();
        $delete = array();

        $exists = array_map(
            function($item) {
                return $item['suk_id'];
            },
            $this->kanban->toArray()
        );

        $sliced = array();

        foreach($items as $item) {
            if (empty($item['suk_id'])) {
                if ($item['suk_selected']) {
                    $create[] = $item;    
                }
            } else {
                if (in_array($item['suk_id'], $exists)) {
                    if ($item['suk_selected']) {
                        $update[] = $item;
                        $sliced[] = $item['suk_id'];    
                    }
                }
            }
        }

        for ($i = count($exists) - 1; $i >= 0; $i--) {
            if ( ! in_array($exists[$i], $sliced)) {
                $delete[] = $exists[$i];
            }
        }

        if (count($delete) > 0) {
            $deleted = UserKanban::find('suk_id IN ('.implode(',', $delete).')');

            foreach($deleted as $item) {
                $item->suk_selected = 0;
                $item->save();
            }
        }

        if (count($update) > 0) {
            foreach($update as $item) {
                $k = UserKanban::findFirst($item['suk_id']);
                $k->save($item);
            }
        }

        if (count($create) > 0) {
            foreach($create as $item) {
                $k = new UserKanban();
                $item['suk_su_id'] = $this->su_id;
                $k->save($item);
            }
        }
    }

    public function saveMenus($items) {

        if (count($items) === 0) {
            // reset
            $this->userMenus->delete();
            return;
        }

        $create = array();
        $update = array();
        $exists = array();

        foreach($this->userMenus as $um) {
            $exists[$um->sum_smn_id] = $um;
        }

        foreach($items as $id) {
            if ( ! isset($exists[$id])) {
                $create[] = $id;
            } else {
                $update[] = $id;
                unset($exists[$id]);
            }
        }

        foreach($exists as $menu => $rm) {
            $rm->sum_selected = 0;
            $rm->save();
        }

        foreach($update as $id) {
            $um = UserMenu::findFirst(array(
                'sum_su_id = :user: AND sum_smn_id = :menu:',
                'bind' => array(
                    'user' => $this->su_id,
                    'menu' => $id
                )
            ));

            if ($um) {
                $um->sum_selected = 1;
                $um->save();
            }
        }

        foreach($create as $id) {
            $um = new UserMenu();

            $um->sum_su_id = $this->su_id;
            $um->sum_smn_id = $id;
            $um->sum_selected = 1;
            
            $um->save();
        }
    }

    public function savePermissions($items) {
        if (count($items) === 0) {
            // reset
            $this->userPermissions->delete();
            return;
        }
        
        $create = array();
        $update = array();
        $exists = array();

        foreach($this->userPermissions as $up) {
            $exists[$up->sup_smc_id] = $up;
        }

        foreach($items as $id) {
            if ( ! isset($exists[$id])) {
                $create[] = $id;
            } else {
                $update[] = $id;
                unset($exists[$id]);
            }
        }

        foreach($exists as $cap => $up) {
            $up->sup_selected = 0;
            $up->save();
        }

        foreach($update as $id) {
            $up = UserPermission::findFirst(array(
                'sup_su_id = :user: AND sup_smc_id = :capability:',
                'bind' => array(
                    'user' => $this->su_id,
                    'capability' => $id
                )
            ));

            if ($up) {
                $up->sup_selected = 1;
                $up->save();
            }
        }

        foreach($create as $id) {
            $up = new UserPermission();
            $up->sup_su_id = $this->su_id;
            $up->sup_smc_id = $id;
            $up->sup_selected = 1;
            $up->save();
        }
    }

    public function saveRoles($items) {
        if (count($items) === 0) {
            $this->roleUsers->delete();
            return;
        }

        $exists = array_flip(
            array_map(
                function($elem){ return $elem['sr_id']; }, 
                $this->roles->toArray()
            )
        );

        $create = array();
        $update = array();
        $delete = array();

        foreach($items as $elem) {
            if ( ! isset($exists[$elem['sr_id']])) {
                $create[] = $elem['sr_id'];
            } else {
                $update[] = $elem['sr_id'];
                unset($exists[$elem['sr_id']]);
            }
        }

        foreach($exists as $id => $bool) {
            $ru = RoleUser::findFirst(array(
                'sru_su_id = :user: AND sru_sr_id = :role:',
                'bind' => array(
                    'user' => $this->su_id,
                    'role' => $id
                )
            ));

            if ($ru) {
                $ru->delete();
            }
        }

        foreach($create as $id) {
            $ru = new RoleUser();

            $ru->sru_sr_id = $id;
            $ru->sru_su_id = $this->su_id;
            $ru->save();
        }
    }

    public static function findInRoles($names = array()) {
        return self::get()
            ->join('App\Roles\Models\RoleUser', 'a.sru_su_id = su_id', 'a', 'left')
            ->join('App\Roles\Models\Role', 'b.sr_id = a.sru_sr_id', 'b', 'left')
            ->where('b.sr_slug IN (:names:)', array('names' => implode(',', $names)))
            ->execute();
    }

}