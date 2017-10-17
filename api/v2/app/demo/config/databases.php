<?php

switch($_SERVER['SERVER_ADMIN']) {
    case 'roso@go.vm':
    case 'roso@xampp.local':
        $databases = array(
            'db' => array(
                'host' => '127.0.0.1',
                'user' => 'root',
                'pass' => 'secret',
                'name' => 'exsys'
            )
        );
        break;
    default:
        $databases = array(
            'db' => array(
                'host' => '10.130.185.250',
                'user' => 'fe3443c1',
                'pass' => '12345',
                'name' => 'exsys'
            )
        );
}

return $databases;