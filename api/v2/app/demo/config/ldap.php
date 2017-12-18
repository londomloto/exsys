<?php
return array(
    'host' => '127.0.0.1',
    'port' => 389,
    'base' => 'dc=ewsi,dc=loc', // ewsi.loc
    'test' => function($username) {
        return $username;
    }
);