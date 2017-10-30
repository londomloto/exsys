<?php
namespace App\Items\Models;

class Item extends \Micro\Model {

    public function initialize() {
        $this->hasMany(
            'item_id',
            'App\Items\Models\ItemForm',
            'item_id',
            array(
                'alias' => 'Forms'
            )
        );

        $this->hasOne(
            'parent_id',
            'App\Items\Models\Item',
            'item_id',
            array(
                'alias' => 'Parent'
            )
        );
    }

    public function getSource() {
        return 'item_table';
    }

    public function isParent() {
        return is_null($this->parent_id);
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        if ($this->parent) {
            $data['item_parent_name'] = $this->parent->item_name;
        }

        $data['item_forms'] = $this->getForms(array('order' => 'index'))->toArray();
        
        return $data;
    }

    public static function combo() {
        $items = self::get()->filterable()->execute()->filter(function($elem){ return $elem; });
        $combo = array();
        self::__createGrid($items, NULL, $combo, $level = 0);

        return array(
            'success' => TRUE,
            'data' => $combo,
            'total' => count($combo)
        );
    }

    private static function __createGrid($stack, $parentId, &$combo, $level = 0) {
        foreach($stack as $row) {
            if ($row->parent_id == $parentId) {
                $data = $row->toArray();
                $data['item_level'] = $level;
                $data['item_pad'] = ($level * 24) . 'px';
                $combo[] = $data;

                if ($row->isParent()) {
                    self::__createGrid($stack, $row->item_id, $combo, ($level + 1));
                }    
            }
        }
    }
}