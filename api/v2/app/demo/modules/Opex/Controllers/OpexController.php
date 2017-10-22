<?php
namespace App\Opex\Controllers;

class OpexController extends \Micro\Controller {

    public function cronAction() {
        $user = $this->auth->user();

        return array(
            'success' => TRUE,
            'data' => array(
                'id_exp' => 'OPX#'.date('my'),
                'subject_exp' => 'Operational '.date('m/y'),
                'date' => date('Y-m-d H:i:s'),
                'date_short' => date('d/m/Y'),
                'user_fullname' => $user['su_fullname'],
                'amounts' => 56000,
                'amounts_formatted' => number_format(56000, 2, ',', '.'),
                'status' => 1,
                'status_name' => 'Draft'
            )
        );
    }

}