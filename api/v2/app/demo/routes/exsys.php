<?php

Router::group(array(
    'prefix' => '/advance',
    'handler' => 'App\Advance\Controllers\AdvanceController',
    'middleware' => 'auth'
))
->get('/{id}/view', 'viewById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/request', 'requestById');


Router::group(array(
    'prefix' => '/expense',
    'handler' => 'App\Expense\Controllers\ExpenseController',
    'middleware' => 'auth'
))
->get('/{id}/view', 'viewById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/request', 'requestById');

Router::group(array(
    'prefix' => '/trips',
    'handler' => 'App\Trips\Controllers\TripsController',
    'middleware' => 'auth'
))
->get('/{id}/view', 'viewById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/request', 'requestById');