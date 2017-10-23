<?php

Router::group(array(
    'prefix' => '/expense',
    'handler' => 'App\Expense\Controllers\ExpenseController',
    'middleware' => 'auth'
))
->get('/cron', 'cron');