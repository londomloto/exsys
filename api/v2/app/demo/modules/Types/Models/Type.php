<?php
namespace App\Types\Models;

class Type extends \Micro\Model {

    public function getSource() {
        return 'master_type';
    }

    public function isRoot() {
        return is_null($this->parent_id);
    }

    public function isTravelling() {
        return $this->type_code == 'travelling';
    }
    
    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['type_group'] = $this->isRoot() ? 'Type' : 'Purpose';
        $data['is_travelling'] = $this->isTravelling();
        return $data;
    }

    public static function grid($options = array()) {
        $result = self::get()
            ->filterable() 
            ->paginate()
            ->map(function($elem) { return $elem; });

        $grid = array();

        self::__buildGrid($result->data, NULL, $grid, 0);
        $result->data = $grid;

        return $result;
    }

    private static function __buildGrid($stack, $parentId = NULL, &$grid, $level = 0) {
        foreach($stack as $item) {
            if ($item->parent_id == $parentId) {
                
                $data = $item->toArray();
                $data['type_level'] = $level;
                $data['type_pad'] = ($level * 24).'px';

                $grid[] = $data;

                if ($item->isRoot()) {
                    self::__buildGrid($stack, $item->type_id, $grid, ($level + 1));
                }
            }
        }
    }
}