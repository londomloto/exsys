<?php

Router::group(array(
    'prefix' => '/advance',
    'handler' => 'App\Advance\Controllers\AdvanceController',
    'middleware' => 'auth'
))
->get('/find-refund', 'findRefund')
->get('/{id}/view', 'viewById')
->get('/{id}/view-refund', 'viewRefundById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/download', 'downloadById')
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/returned', 'returnedById')
->post('/{id}/fa-receive', 'faReceiveById')
->post('/{id}/fa-approve', 'faApproveById')
->post('/{id}/fa-reject', 'faRejectById')
->post('/{id}/fa-returned', 'faReturnedById')
->post('/{id}/refund-submit', 'refundSubmitById')
->post('/{id}/refund-approve', 'refundApproveById')
->post('/{id}/refund-returned', 'refundReturnedById');

Router::post('/advance/ax-submit','App\Advance\Controllers\AdvanceController@axSubmit');
Router::post('/advance/ax-return-submit','App\Advance\Controllers\AdvanceController@axReturnSubmit');
Router::post('/expense/ax-submit','App\Expense\Controllers\ExpenseController@axSubmit');
// access nya http://IP-kita/exsys/api/v2/demo/ax-submit


Router::group(array(
    'prefix' => '/advance/items',
    'handler' => 'App\Advance\Controllers\ItemsController',
    'middleware' => 'auth'
))
->get('/{id}/history', 'historyById');

Router::group(array(
    'prefix' => '/advance/refund',
    'handler' => 'App\Advance\Controllers\RefundController',
    'middleware' => 'auth'
))
->post('/{id}/upload', 'uploadById')
->post('/{id}/download', 'downloadById');


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
->post('/{id}/hr-approve', 'hrApproveById')
->post('/{id}/hr-reject', 'hrRejectById')
->post('/{id}/hr-returned', 'hrReturnedById')
->post('/{id}/fa-receive', 'faReceiveById')
->post('/{id}/fa-approve', 'faApproveById')
->post('/{id}/fa-reject', 'faRejectById')
->post('/{id}/fa-returned', 'faReturnedById');

Router::group(array(
    'prefix' => '/expense/items',
    'handler' => 'App\Expense\Controllers\ItemsController',
    'middleware' => 'auth'
))
->get('/{id}/history', 'historyById');

Router::group(array(
    'prefix' => '/trips',
    'handler' => 'App\Trips\Controllers\TripsController',
    'middleware' => 'auth'
))
->get('/{id}/view', 'viewById')
->post('/{id}/submit', 'submitById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/download', 'downloadById') 
->post('/{id}/reject', 'rejectById')
->post('/{id}/approve', 'approveById')
->post('/{id}/returned', 'returnedById')
->post('/{id}/accept-ticket', 'acceptTicketById')
->post('/{id}/accept-reschedule', 'acceptRescheduleById')
->post('/{id}/reject-ticket', 'rejectTicketById')
->post('/{id}/reject-reschedule', 'rejectRescheduleById');

Router::group(array(
    'prefix' => '/trips/items',
    'handler' => 'App\Trips\Controllers\ItemsController',
    'middleware' => 'auth'
))
->get('/{id}/history', 'historyById')
->post('/{id}/upload', 'uploadById')
->post('/{id}/download', 'downloadById')
->post('/{id}/reschedule', 'rescheduleById');

Router::group(array(
    'prefix' => '/trips/items-history',
    'handler' => 'App\Trips\Controllers\ItemsHistoryController',
    'middleware' => 'auth'
))
->post('/{id}/download', 'downloadById');

Router::group(array(
    'prefix' => '/tasks',
    'handler' => 'App\Tasks\Controllers\TasksController',
    'middleware' => 'auth'
))
->get('/summary', 'summary');