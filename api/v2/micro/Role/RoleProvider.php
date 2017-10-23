<?php
namespace Micro\Role;

class RoleProvider extends \Micro\Component {

    protected $_providers;
    protected $_auth;

    public function __construct() {
        $app = $this->getApp();

        $this->_providers = $app->config->role->providers;
        $this->_auth = $app->auth;
    }

    protected function _run($class, $method, $args) {
        return call_user_func_array(array($class, $method), $args);
    }

    public function get() {
        static $assigned;
        if (is_null($assigned)) {
            $user = $this->_auth->user(NULL, TRUE);
            if ($user) {
                $assigned = $user->roles->filter(function($role){
                    return $role;
                });
            } else {
                $assigned = array();
            }
        }
        return $assigned;
    }

    public function is($role) {
        static $names;
        if (is_null($names)) {
            $names = array_flip(array_map(function($elem){ return $elem->sr_slug; }, $this->get()));
        }
        return isset($names[$role]);
    }

    public function menus() {
        $user = $this->_auth->user(NULL, TRUE);
        if ($user) {

            $nodes = array();
            // $menus = $user->getMenus(array('smn_visible = 1'))->filter(function($elem){ return $elem; });
            $menus = $user->getMenus(array('smn_visible = 1'));
            $stack = array_flip(array_map(function($elem){ return $elem->smn_id; }, $menus));
            
            foreach($menus as $menu) { 
                if ( ! empty($menu->smn_parent_id)) {
                    $menu->traverseUp(function($elem) use (&$stack, &$nodes){
                        if ( ! isset($stack[$elem->smn_id])) {
                            $nodes[] = $elem;
                            $stack[$elem->smn_id] = TRUE;
                        }
                    });
                }
                $nodes[] = $menu;
            }

            usort($nodes, function($a, $b){
                $va = $a->smn_order;
                $vb = $b->smn_order;

                if ($va == $vb) return 0;
                return $va < $vb ? -1 : 1;
            });

            $tree = array();

            self::__createTreeMenu($nodes, 0, $tree);

            return $tree;
        }

        return array();
    }

    private static function __createTreeMenu($menus, $parentId, &$result) {
        $stack = array_slice($menus, 0);

        foreach($menus as $idx => $elem) {
            if ($elem->smn_parent_id == $parentId) {
                $node = $elem->toArray();

                if (self::__menuIsParent($elem, $stack)) {
                    $node['smn_children']  = array();
                    self::__createTreeMenu($menus, $elem->smn_id, $node['smn_children']);
                } else {
                    array_splice($stack, $idx, 1);
                }
                $result[] = $node;
            }
        }
    }

    private static function __menuIsParent($menu, $menus) {
        foreach($menus as $elem) {
            if ($elem->smn_parent_id == $menu->smn_id) {
                return TRUE;
            }
        }
        return FALSE;
    }

    public function permissions() {
        static $perms;

        if (is_null($perms)) {
            $user = $this->_auth->user(NULL, TRUE);
            $perms = array();

            if ($user) {
                foreach($user->getPermissions() as $cap) {
                    $module = $cap->module;
                    if ($module) {
                        $context = $module->sm_name;
                        $permission = strtolower($cap->smc_name).'@'.$context;

                        $perms[] = array(
                            'permission' => $permission, 
                            'module' => $context,
                            'capability' => $cap->smc_name,
                            'description' => $cap->smc_description
                        );
                    }
                }
            }
        }

        return $perms;
    }

    public function can($permission) {
        static $stack;

        if (is_null($stack)) {
            $stack = array_flip(array_map(function($elem){ return $elem['permission']; }, $this->permissions()));
        }

        return isset($stack[$permission]);
    }

    public function validate($permission) {
        if ( ! $this->can($permission)) {
            throw new \Phalcon\Exception("You don't have privilege to perform this action");
        }
    }

}