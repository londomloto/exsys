<?php

Router::get('/', function(){
    return array(
        'success' => TRUE,
        'message' => 'Welcome to demo application'
    );
});

Router::get('/test/ldap', function(){

    $conn = ldap_connect('ldap://192.168.100.249');
    ldap_set_option($conn, LDAP_OPT_PROTOCOL_VERSION, 3);
    ldap_set_option($conn, LDAP_OPT_REFERRALS, 0);

    $bind = ldap_bind($conn, 'asepjaelani', '6911121394');
    var_dump($bind);

});

Router::get('/test/phpinfo', function(){
    phpinfo();
});

Router::get('/test/excel', function(){
    
    $xbook = new \ExcelBook('Said M Fahmi', 'linux-edd01c7891abac1006082d3240p0d7u5', TRUE);
    $xbook->setLocale('UTF-8');

    $sheet = $xbook->addSheet('Sheet1');
    $data = [
        [1, 1500, 'John', 'Doe'],
        [2,  750, 'Jane', 'Doe']
    ];

    $row = 1;

    foreach($data as $item){
        $sheet->writeRow($row, $item);
        $row++;
    }

    $path = APPPATH.'public/resources/downloads/test.xlsx';
    $xbook->save($path);


    if (file_exists($path)) {

        $content = file_get_contents($path);

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="test.xlsx"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
        header('Cache-Control: cache, must-revalidate');
        header('Pragma: public');
        // header('Set-Cookie: download=done; path=/');

        echo $content;
    }

});

// example download
Router::post('/home/download', 'App\Home\Controllers\HomeController@download');