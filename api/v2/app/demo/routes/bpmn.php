<?php

Router::group(array(
    'prefix' => '/bpmn/diagrams',
    'handler' => 'App\Bpmn\Controllers\DiagramsController',
    'middleware' => 'auth'
))
->get('/expand/{id}', 'expand')
->post('/store', 'store')
->post('/upload/{id}', 'upload');

Router::group(array(
    'prefix' => '/bpmn/forms',
    'handler' => 'App\Bpmn\Controllers\FormsController',
    'middleware' => 'auth'
))
->post('/upload/{id}', 'upload')
->get('/download/{filename}','download')
->get('/view/{filename}','view');

Router::group(array(
    'prefix' => '/bpmn',
    'handler' => 'App\Bpmn\Controllers\BpmnController',
    'middleware' => 'auth'
))
->get('/workers', 'workers')
->get('/activities/{worker}', 'activities')
->get('/statuses/{worker}', 'statuses')
->post('/start/{worker}', 'start')
->post('/stop/{worker}', 'stop')
->post('/prev/{worker}', 'prev')
->post('/next/{worker}', 'next');