<?php
namespace App\Items\Models;

class Item extends \Micro\Model {

    const ROOT_VALUE = 0;

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

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['is_root'] = $this->parent_id == self::ROOT_VALUE;
        
        if ($this->parent) {
            $data['item_parent_name'] = $this->parent->item_name;
        }

        $data['item_forms'] = $this->getForms(array('order' => 'index'))->toArray();
        
        return $data;
    }

    public function bubble($handler) {
        $handler($this);
        $parent = self::findFirst($this->parent_id);

        if ($parent) {
            $parent->bubble($handler);
        }
    }

    public static function tree() {
        $found = array();

        $items = self::get()->filterable()->execute()->filter(function($elem) use (&$found) { 
            $found[$elem->item_id] = TRUE;
            return $elem; 
        });

        foreach($items as $elem) {
            if ($elem->parent_id != self::ROOT_VALUE && ! isset($found[$elem->parent_id])) {
                $elem->bubble(function($e) use ($elem, &$found, &$items){
                    if ($e->item_id != $elem->item_id) {
                        $found[$e->item_id] = TRUE;
                        $items[] = $e;
                    }
                });
            }
        }

        $tree = array();
        self::__createTree($items, self::ROOT_VALUE, $tree, $level = 0);

        return array(
            'success' => TRUE,
            'data' => $tree,
            'total' => count($tree)
        );
    }

    private static function __createTree($stack, $parentId, &$tree, $level = 0) {
        foreach($stack as $row) {
            if ($row->parent_id == $parentId) {
                $data = $row->toArray();
                $data['item_level'] = $level;
                $data['item_pad'] = ($level * 24) . 'px';
                $tree[] = $data;

                self::__createTree($stack, $row->item_id, $tree, ($level + 1));
            }
        }
    }

    private static function __isParent($node, $stack) {
        foreach($stack as $elem) {
            if ($elem->parent_id == $node->item_id) {
                return TRUE;
            }
        }

        return FALSE;
    }

}