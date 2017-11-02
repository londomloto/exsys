<?php
namespace App\Config\Controllers;

use App\Config\Models\Config;

class ConfigController extends \Micro\Controller {

    public function loadAction() {
        $data = array();
        $rows = Config::get()->execute();

        foreach($rows as $row) {
            $key = $row->sc_name;
            $val = $row->sc_value;

            $data[$key] = $val;
        }

        // update version
        $data['app_version'] = '1.0.10';

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }
    
    public function saveAction() {
        $post = $this->request->getJson();

        foreach($post as $key => $val) {
            $model = Config::findFirst(array(
                'sc_name = :name:',
                'bind' => array('name' => $key)
            ));

            if ($model) {
                $model->sc_value = $val;
            } else {
                $model = new Config();
                $model->sc_name = $key;
                $model->sc_value = $val;
            }

            $model->save();
        }

        return array(
            'success' => TRUE,
            'data' => $post
        );
    }

}