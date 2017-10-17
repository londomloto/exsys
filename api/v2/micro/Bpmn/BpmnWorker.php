<?php
namespace Micro\Bpmn;

class BpmnWorker {

    protected $_name;
    protected $_provider;
    protected $_diagram;

    public function __construct($name, $provider) {
        $this->_name = $name;
        $this->_provider = $provider;
        
        // fetch diagram
        $query = call_user_func_array($this->_provider.'::get', array());
        $query->where('slug = :name:', array('name' => $name));
            
        $this->_diagram = $query->execute()->getFirst();
    }

    public function id() {
        return $this->_diagram ? $this->_diagram->id : NULL;
    }

    public function name() {
        return $this->_name;
    }

    public function text() {
        if ($this->_diagram) {
            return $this->_diagram->name;
        }
        return NULL;
    }

    public function description() {
        if ($this->_diagram) {
            return $this->_diagram->description;
        }
        return NULL;
    }

    public function diagram() {
        return $this->_diagram;
    }

    public function activities() {
        if ( ! $this->_diagram) {
            return $this->__invalid();
        }

        $start = $this->_diagram->getStart();
        
        if ( ! $start) {
            return $this->__invalid();
        }

        $activities = array();
        $stacks = array();

        $this->__cascadeShapes($start, function($shape) use (&$stacks, &$activities){
            if ( ! in_array($shape->id, $stacks) && ! $shape->isStop()) {
                $stacks[] = $shape->id;
                $parent   = $shape->parent;
                
                $activity = array(
                    'id' => $shape->id,
                    'text' => $shape->label,
                    'type' => $shape->type,
                    'init' => $shape->isStart(),
                    'role' => $parent ? $parent->label : NULL
                );

                $activities[] = $activity;
            }
        });

        return array(
            'success' => TRUE,
            'data' => $activities
        );
    }

    public function statuses() {
        if ( ! $this->_diagram) {
            return $this->__invalid();
        }

        $statuses = array();

        foreach($this->_diagram->links as $link) {

            if(!$link->target->isStop()){
                $prev = array();
                $next = array();

                foreach($link->prevLinks() as $item) {
                    $prev[] = array(
                        'id' => $item->id,
                        'name' => $item->name,
                        'text' => $item->label,
                        'color' => $item->stroke,
                        'worker_id' => $this->_diagram->id,
                        'worker_name' => $this->_diagram->name
                    );
                }

                foreach($link->nextLinks() as $item) {
                    
                    $next[] = array(
                        'id' => $item->id,
                        'name' => $item->name,
                        'text' => $item->label,
                        'color' => $item->stroke,
                        'worker_id' => $this->_diagram->id,
                        'worker_name' => $this->_diagram->name,
                        'cond' => $item->conditions()
                    );
                }

                $statuses[] = array(
                    'id' => $link->id,
                    'name' => $link->name,
                    'text' => $link->label,
                    'color' => $link->stroke,
                    'prev' => $prev,
                    'next' => $next,
                    'worker_id' => $this->_diagram->id,
                    'worker_name' => $this->_diagram->name
                );
            }
        }

        return array(
            'success' => TRUE,
            'data' => $statuses
        );
    }
    
    public function start($payload = array()) {
        if ( ! $this->_diagram) {
            return $this->__invalid();
        }

        $start = NULL;

        foreach($this->_diagram->shapes as $shape) {
            if ($shape->isStart()) {
                $start = $shape->outgoingLinks->getFirst();
                break;
            }
        }

        $result = array(
            'success' => TRUE,
            'data' => array()
        );

        if ($start) {

            $valid = $this->validate($payload, $start->conditions());

            if ($valid) {
                $next = array();

                foreach($start->nextLinks() as $link) {
                    $next[] = array(
                        'id' => $link->id,
                        'name' => $link->name,
                        'text' => $link->label,
                        'cond' => $link->conditions()
                    );
                }

                $target = $start->target;

                $result['data'] = array(
                    'id' => $start->id,
                    'name' => $start->name,
                    'text' => $start->label,
                    'prev' => array(),
                    'next' => $next,
                    'cond' => $start->conditions(),
                    'target' => $target ? $target->id : NULL
                );
            }
            
        }

        return $result;
    }

    public function stop() {
        if ( ! $this->_diagram) {
            return $this->__invalid();
        }

        $links = NULL;

        foreach($this->_diagram->shapes as $shape) {
            if ($shape->isStop()) {
                $links = $shape->incomingLinks;
                break;
            }
        }

        $result = array(
            'success' => TRUE,
            'data' => array()
        );

        if ($links) {
            $stop = array();
            foreach($links as $link) {

                $prev = array();
                $next = array();

                foreach($link->prevLinks() as $item) {
                    $prev[] = array(
                        'id' => $item->id,
                        'name' => $item->name,
                        'text' => $item->label
                    );
                }

                $stop[] = array(
                    'id' => $link->id,
                    'name' => $link->name,
                    'text' => $link->label,
                    'prev' => $prev,
                    'next' => $next
                );
            }
            $result['data'] = $stop;
        }

        return $result;
    }

    public function next($current, $payload = array()) {
        if ( ! $this->_diagram) {
            return $this->__invalid();
        }

        // $currentLink = $this->__getLinkByName($current);
        $currentLink = $this->__getLinkById($current);
        
        $result = array(
            'success' => FALSE,
            'data' => array()
        );

        if ($currentLink) {
            $result['success'] = TRUE;
            $statuses = array();

            foreach($currentLink->nextLinks() as $link) {
                $valid = $this->validate($payload, $link->conditions());
                if ($valid) {
                    $target = $link->target;
                    if(!$target->isStop()){
                        $statuses[] = array(
                            'id' => $link->id,
                            'name' => $link->name,
                            'text' => $link->label,
                            'cond' => $link->conditions(),
                            'target' => $target ? $target->id : NULL
                        );
                    }  
                }
            }

            $result['data'] = $statuses;
        }

        return $result;
    }

    private function __cascadeShapes($shape, $callback) {
        $links = $shape->getOutgoingLinks();    

        $callback($shape);

        if ($links->count() > 0) {
            foreach($links as $link) {
                $target = $link->target;
                if ($target) {
                    $this->__cascadeShapes($target, $callback);
                }
            }
        }


    }

    public function validate($payload, $conds) {
        // pass if no validation required
        if (empty($conds)) {
            return TRUE;
        }

        $checks = array_map(function($cond){ return $cond->field; }, $conds);
        $fields = array_keys($payload);
        $sliced = array_intersect($checks, $fields);

        // return false if number of check greater than payload fields
        if (count($checks) > count($sliced)) {
            return FALSE;
        }

        $valid = TRUE;
        $line = NULL;

        foreach($conds as $cond) {
            $op = 'AND';

            if ($line) {
                $op = $line->operator;
                $op = empty($op) ? 'AND' : $op;
            }

            $cv = $cond->value;

            if (strtolower($cv) == 'null') {
                $cv = NULL;
            }

            foreach($fields as $k) {
                if ($k != $cond->field) continue;

                $pv = $payload[$k];

                switch(strtolower(trim($cond->comparison))) {
                    case '=':
                        if ($op == 'AND') {
                            $valid = $valid && ($pv == $cv);
                        } else {
                            $valid = $valid || ($pv == $cv);
                        }
                        break;
                    case 'is':
                        if ($op == 'AND') {
                            $valid = $valid && ($pv == $cv);
                        } else {
                            $valid = $valid || ($pv == $cv);
                        }
                        break;
                    case 'is not null':
                        if ($op == 'AND') {
                            $valid = $valid && ($pv != '');
                        } else {
                            $valid = $valid || ($pv != '');
                        }
                        break;
                    case 'like':
                    case 'contains':
                        if ($op == 'AND') {
                            $valid = $valid && (preg_match('/'.strtoupper($cv).'/', strtoupper($pv)));
                        } else {
                            $valid = $valid || (preg_match('/'.strtoupper($cv).'/', strtoupper($pv)));
                        }
                        break;
                    case '!=':
                    case '<>':
                        if ($op == 'AND') {
                            $valid = $valid && ($pv != $cv);
                        } else {
                            $valid = $valid || ($pv != $cv);
                        }
                        break;
                    case '<':
                        $pv = (double) $pv;
                        $cv = (double) $cv;

                        if ($op == 'AND') {
                            $valid = $valid && ($pv < $cv);
                        } else {
                            $valid = $valid || ($pv < $cv);
                        }
                        break;
                    case '<=':
                        $pv = (double) $pv;
                        $cv = (double) $cv;

                        if ($op == 'AND') {
                            $valid = $valid && ($pv <= $cv);
                        } else {
                            $valid = $valid || ($pv <= $cv);
                        }
                        break;
                    case '>':
                        $pv = (double) $pv;
                        $cv = (double) $cv;

                        if ($op == 'AND') {
                            $valid = $valid && ($pv > $cv);
                        } else {
                            $valid = $valid || ($pv > $cv);
                        }
                        break;
                    case '>=':
                        $pv = (double) $pv;
                        $cv = (double) $cv;

                        if ($op == 'AND') {
                            $valid = $valid && ($pv >= $cv);
                        } else {
                            $valid = $valid || ($pv >= $cv);
                        }
                        break;
                    case 'in':
                        try {
                            $tmp = json_decode($cv);
                            if ($op == 'AND') {
                                
                            } else {

                            }
                        } catch(\Exception $e) {
                            if ($op == 'AND') {
                                $valid = $valid && FALSE;   
                            } else {
                                $valid = $valid || FALSE;
                            }
                        }
                        break;
                    case 'between':
                        try {
                            $tmp = json_decode($cv);
                            array_pad($tmp, 2, NULL);

                            $min = $tmp[0];
                            $max = $tmp[1];

                            if ($op == 'AND') {
                                $valid = $valid && ($pv >= $min && $pv <= $max);
                            } else {
                                $valid = $valid || ($pv >= $min && $pv <= $max);
                            }

                        } catch(\Exception $e){
                            if ($op == 'AND') {
                                $valid = $valid && FALSE;
                            } else {
                                $valid = $valid || FALSE;
                            }
                        };
                        break;
                }
            }

            $line = $cond;
        }

        return $valid;
    }

    private function __getLinkById($id) {
        $found = NULL;
        foreach($this->_diagram->links as $link) {
            if ($link->id == $id) {
                $found = $link;
                break;
            }
        }
        return $found;
    }

    private function __getLinkByName($name) {
        $found = NULL;
        foreach($this->_diagram->links as $link) {
            if ($link->name == $name) {
                $found = $link;
                break;
            }
        }
        return $found;
    }

    private function __invalid() {
        return array(
            'success' => FALSE,
            'message' => 'Worker ' . $this->_name . ' not found!'
        );
    }
}