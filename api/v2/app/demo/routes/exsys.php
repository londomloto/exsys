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
