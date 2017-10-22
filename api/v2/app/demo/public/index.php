<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
date_default_timezone_set('Asia/Jakarta');

try {       

    define('APPPATH', dirname(__DIR__).'/');
    define('PUBPATH', dirname(__DIR__).'/public/');
    define('SYSPATH', dirname(dirname(APPPATH)).'/micro/');

    require_once SYSPATH . 'App.php';

    $app = new \Micro\App('demo');
    $app->run();

} catch(\Phalcon\Exception $e) {

    header('Content-Type: application/json');

    $response = array(
        'success' => FALSE,
        'status' => $e->getCode(),
        'message' => $e->getMessage()
    );

    print(json_encode($response, JSON_PRETTY_PRINT));


} catch(PDOException $e) {

    header('Content-Type: application/json');

    $response = array(
        'success' => FALSE,
        'status' => $e->getCode(),
        'message' => $e->getMessage()
    );
    
    print(json_encode($response, JSON_PRETTY_PRINT));
}