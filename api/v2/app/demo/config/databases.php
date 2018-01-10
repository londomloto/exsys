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

    case 'iwan@researchs.one':
        $databases = array(
            'db' => array(
                'host' => '127.0.0.1',
                'user' => 'root',
                'pass' => 'toor',
                'name' => 'db_exsys'
            )
        );
        break;

    default:
        $databases = array(
            'db' => array(
                'host' => '127.0.0.1',
                'user' => 'root',
                'pass' => 'xsys123',
                'name' => 'exsys'
            )
        );
}

return $databases;