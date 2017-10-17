<?php

/**
 * module: config
 */
Router::group(array(
    'prefix' => '/config',
    'handler' => 'App\Config\Controllers\ConfigController',
    'middleware' => 'auth'
))
->post('/save', 'save');

Router::get('/config/load', 'App\Config\Controllers\ConfigController@load');

/**
 * module: auth
 */
Router::group(array(
    'prefix' => '/auth',
    'handler' => 'App\Auth\Controllers\AuthController',
    'middleware' => 'auth'
))
->get('/user', 'user')
->get('/validate', 'validate')
->get('/validate-password', 'validatePassword');

Router::post('/auth/login', 'App\Auth\Controllers\AuthController@login');
Router::get('/auth/captcha', 'App\Auth\Controllers\AuthController@captcha');

/**
 * module: assets
 */
Router::get('/assets/thumb', 'App\Assets\Controllers\AssetsController@thumb');

/**
 * module: profile
 */
Router::group(array(
    'prefix' => '/profile',
    'handler' => 'App\Profile\Controllers\ProfileController',
    'middleware' => 'auth'
))
->post('/{id}/upload', 'upload');

/**
 * module: users
 */
Router::group(array(
    'prefix' => '/users',
    'handler' => 'App\Users\Controllers\UsersController',
    'middleware' => 'auth'
))
->post('/{id}/upload', 'upload');

/**
 * module: products
 */
Router::group(array(
    'prefix' => '/products',
    'handler' => 'App\Products\Controllers\ProductsController',
    'middleware' => 'auth'
))
->get('/services', 'services');

/**
 * module: kanban
 */
Router::group(array(
    'prefix' => '/kanban',
    'handler' => 'App\Kanban\Controllers\KanbanController',
))
->post('/comment', 'comment');