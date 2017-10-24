<?php
namespace App\Organization\Models;

class Organization extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'org_type_id',
            'App\Organization\Models\OrganizationType',
            'org_type_id',
            array(
                'alias' => 'OrganizationType'
            )
        );
    }

    public function getSource() {
        return 'master_organization';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['org_type_name'] = '';
        if ($this->organizationType) {
            $data['org_type_name'] = $this->organizationType->org_type_name;
        }
        return $data;
    }

    public static function grid() {
        $orgs = self::get()->execute()->filter(function($elem){ return $elem; });
        $grid = array();
        self::__buildGrid($orgs, 0, $grid, 0);

        return array(
            'success' => TRUE,
            'data' => $grid,
            'total' => count($orgs)
        );
    }

    private static function __buildGrid($orgs, $parentId = 0, &$grid, $level = 0) {
        foreach($orgs as $elem) {
            if ($elem->org_parent_id == $parentId) {
                $data = $elem->toArray();
                $data['org_level'] = $level;
                $data['org_pad'] = ($level * 24) .'px';
                $grid[] = $data;

                if (self::__isParent($elem, $orgs)) {
                    self::__buildGrid($orgs, $elem->org_id, $grid, ($level + 1));
                }
            }
        }
    }

    private static function __isParent($elem, $stack) {
        foreach($stack as $item) {
            if ($item->org_parent_id == $elem->org_id) {
                return TRUE;
            }
        }
        return FALSE;
    }
}