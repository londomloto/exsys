<?php

return array(
    
    'name' => 'exsys-app',

    'debug' => FALSE,

    'title' => 'EASTWEST - Expense System',

    'description' => '',

    'keywords' => '',

    'author' => 'ALMAR',

    'env' => 'DEVELOPMENT',

    'timezone' => 'UTC',

    'locale' => 'en',

    'secret' => '279nBsxjS77rmJzQbHEFWA==',

    'providers' => array(
        'auth' => 'Micro\Auth\AuthProvider',
        'role' => 'Micro\Role\RoleProvider',
        'file' => 'Micro\File\FileProvider',
        // 'bpmn' => 'Micro\Bpmn\BpmnProvider',
        'ldap' => 'Micro\Ldap\LdapProvider',
        // 'dx'   => 'Micro\Dx\DxProvider'
    ),

    'middleware' => array(
        'auth' => 'Micro\Auth\AuthMiddleware'
    ),

    'aliases' => array(
        'User' => 'App\Users\Models\User'
    )

);