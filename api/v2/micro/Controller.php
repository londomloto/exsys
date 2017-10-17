<?php
namespace Micro;

use Phalcon\Mvc\Dispatcher;

abstract class Controller extends \Phalcon\Mvc\Controller {
    
    public function preflightAction() {

        return array(
            'success' => TRUE
        );

    }

}