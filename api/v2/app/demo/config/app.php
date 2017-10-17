<?php

return array(
    
    'name' => 'bpm-app',

    'debug' => FALSE,

    'title' => 'Business Process Model',

    'description' => '',

    'keywords' => '',

    'author' => 'Kreasindo Cipta Teknologi',

    'env' => 'DEVELOPMENT',

    'timezone' => 'UTC',

    'locale' => 'en',

    'secret' => '279nBsxjS77rmJzQbHEFWA==',

    'providers' => array(
        'auth' => 'Micro\Auth\AuthProvider',
        'role' => 'Micro\Role\RoleProvider',
        'file' => 'Micro\File\FileProvider',
        'bpmn' => 'Micro\Bpmn\BpmnProvider',
        'dx'   => 'Micro\Dx\DxProvider'
    ),

    'middleware' => array(
        'auth' => 'Micro\Auth\AuthMiddleware'
    ),

    'aliases' => array(
        'User' => 'App\Users\Models\User'
    )

);