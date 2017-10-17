<?php
namespace Micro;

use Phalcon\Mvc\Model\Query\Builder as QueryBuilder;

class ModelQuery {

    private $__di;
    private $__builder;
    private $__template;
    private $__limit;
    private $__start;
    private $__fields;

    public function __construct(\Phalcon\Mvc\Model $template, \Phalcon\DiInterface $di = NULL) {
        $this->__builder = new QueryBuilder(array(
            'models' => array(get_class($template))
        ));
        
        $this->__template = $template;
        $this->__di = $di;
        $this->__fields = new \stdClass();

        foreach($template->getModelsMetaData()->getAttributes($template) as $name) {
            $this->__fields->{$name} = TRUE;
        }
    }

    public final function __call($method, $args) {
        if (method_exists($this->__builder, $method)) {
            call_user_func_array(array($this->__builder, $method), $args);
            return $this;
        } else {
            throw new \Phalcon\Exception("Call to undefined method Micro\Paginator::$method");
        }
    }

    public function getBuilder() {
        return $this->__builder;
    }

    public function limit($limit, $start = NULL) {
        $this->__limit = $limit;
        $this->__start = $start;

        return $this;
    }

    public function getLimit() {
        return $this->__limit;
    }

    public function getStart() {
        return $this->__start;
    }

    public function join($model, $conditions = NULL, $alias = NULL, $type = 'left') {
        $this->__builder->join($model, $conditions, $alias, $type);

        $template = new $model();

        foreach($template->getModelsMetaData()->getAttributes($template) as $name) {
            if ( ! isset($this->__fields->{$name})) {
                $this->__fields->{$name} = TRUE;
            }
        }

        return $this;
    }

    public function sortable() {
        $request = $this->__di->getRequest();
        $sort = $request->getQuery('sort');

        if ( ! empty($sort)) {
            $sort = json_decode($sort);
            foreach($sort as $item) {
                if (isset($this->__fields->{$item->property})) {
                    $this->__builder->orderBy($item->property . ' ' . $item->direction);    
                }
            }
        }
        return $this;
    }

    public function filterable() {
        $request = $this->__di->getRequest();

        $query = $request->getQuery('query');
        $fields = $request->getQuery('fields');

        if ( ! empty($query) && ! empty($fields)) {
            $fields = json_decode($fields);
            $where = array();

            foreach($fields as $name) {
                if (isset($this->__fields->{$name})) {
                    $where[] = $name . ' LIKE :q: ';
                }
            }

            if ( ! empty($where)) {
                $this->__builder->where('(' . implode(' OR ', $where) . ')', array('q' => '%'.$query.'%'));    
            }
            
        }

        return $this;
    }

    public function execute() {
        $query = $this->__builder->getQuery()->getSql();
        $columns = $this->__builder->getColumns();

        $manager = \Phalcon\DI::getDefault()->get('modelsManager');
        $database = $manager->getReadConnection($this->__template);
        $result = $database->query($query['sql'], $query['bind'], $query['bindTypes']);
        
        $dataset = new ModelDataset(NULL, $this->__template, $result);
        $dataset->setColumns($columns);

        return $dataset;
    }

    public function paginate($fetchRequest = TRUE) {
        if ($fetchRequest && $this->__di) {
            $request = $this->__di->getRequest();
            $this->__limit = $request->getQuery('limit');
            $this->__start = $request->getQuery('start');
        }

        $columns = $this->__builder->getColumns();
        $pageset = new ModelPageset($this);
        $pageset->setColumns($columns);

        return $pageset;
    }
}