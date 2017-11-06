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
->post('/{id}/returned', 'returnedById')
->post('/{id}/fa-receive', 'faReceiveById')
->post('/{id}/fa-approve', 'faApproveById')
->post('/{id}/fa-reject', 'faRejectById')
->post('/{id}/fa-returned', 'faReturnedById');

Router::group(array(
    'prefix' => '/expense',
    'handler' => 'App\Expense\Controllers\ExpenseController',
    'middleware' => 'auth'
))
->get('/{id}/test', 'test')
->get('/{id}/view', 'viewById')
->get('/{id}/currencies', 'currenciesById')
->get('/{id}/summary', 'summaryById')
->get('/{id}/journals', 'journalsById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/returned', 'returnedById')
->post('/{id}/fa-receive', 'faReceiveById')
->post('/{id}/fa-approve', 'faApproveById')
->post('/{id}/fa-reject', 'faRejectById')
->post('/{id}/fa-returned', 'faReturnedById');

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
->post('/{id}/returned', 'returnedById')
->post('/{id}/finish-ticket', 'finishTicketById')
->post('/{id}/reject-ticket', 'rejectTicketById');