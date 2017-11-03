<?php
namespace App\Seeds\Models;

class Seed extends \Micro\Model {

    public function getSource() {
        return 'master_seed';
    }

    public function isParent() {
        return empty($this->parent_id);
    }

    public static function combo() {
        $query = self::get()->filterable()->sortable()->paginate();
        $seeds = $query->data->filter(function($e){ return $e; });
        $array = array();

        $data = self::__buildCombo($seeds);
        $query->data = $data;

        return $query;
    }

    private static function __buildCombo($seeds) {
        $grouped = array();

        foreach($seeds as $seed) {
            $group = empty($seed->parent_id) ? $seed->seed_id : $seed->parent_id;

            $item = $seed->toArray();
            
            if ( ! isset($grouped[$group])) {
                if ($group == $seed->seed_id) {
                    $item['children'] = array();
                    $item['seed_level'] = 0;
                    $item['seed_pad'] = '0px';
                    $item['included'] = TRUE;
                    $grouped[$group] = $item;
                } else {
                    $parent = self::findFirst('seed_id = '.$group);
                    if ($parent) {
                        $item['included'] = TRUE;
                        $item['seed_level'] = 1;
                        $item['seed_pad'] = '24px';
                        $parentItem = $parent->toArray();
                        $parentItem['children'] = array($item);
                        $parentItem['included'] = FALSE;
                        $grouped[$group]  = $parentItem;
                    }
                }
                
            } else {
                $item['seed_level'] = 1;
                $item['seed_pad'] = '24px';
                $item['included'] = TRUE;
                $grouped[$group]['children'][] = $item;
            }
        }

        // flatted
        $flatten = array();

        self::__cascade(array_values($grouped), function($item) use (&$flatten){
            $included = $item['included'];
            unset($item['children'], $item['included']);

            if ($included) {
                $flatten[] = $item;
            }
        });

        return $flatten;
    }
    
    private static function __cascade($nodes, $handler) {
        foreach($nodes as $node) {
            $handler($node);
            if (isset($node['children'])) {
                self::__cascade($node['children'], $handler);
            }
        }
    }

}