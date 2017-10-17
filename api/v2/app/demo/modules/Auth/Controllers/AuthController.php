<?php
namespace App\Auth\Controllers;

class AuthController extends \Micro\Controller {

    public function loginAction() {
        $post = $this->request->getJson();
        
        if ( ! isset($post['email']) || ! isset($post['password'])) {
            throw new \Phalcon\Exception('Invalid parameters');
        }

        if ($this->auth->isCaptchaEnabled()) {
            if ( ! isset($post['captcha'])) {
                throw new \Phalcon\Exception('Invalid parameters');
            }

            // validate captcha first
            if ( ! $this->security->verifyCaptcha($post['captcha'])) {
                throw new \Phalcon\Exception('Invalid security code');
            }
        }
        
        $user = $this->auth->login($post['email'], $post['password']);

        if ( ! $user) {
            throw new \Phalcon\Exception($this->auth->error());
        }

        return array(
            'success' => TRUE,
            'data' => $user
        );
    }

    public function validateAction() {
        return array(
            'success' => TRUE,
            'data'=> $this->auth->validate()
        );
    }

    public function validatePasswordAction() {
        $user = $this->auth->user();
        $pass = $this->request->getQuery('pass');

        $data = array(
            'valid' => FALSE
        );

        if ($user) {
            $find = \App\Users\Models\User::findFirst($user['su_id']);
            if ($find) {
                $data['valid'] = $this->security->verifyHash($pass, $find->su_passwd);
            }
        }

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }

    public function captchaAction() {
        $type = $this->request->getQuery('type');

        if ($type == 'image') {
            $this->security->createCaptcha('image');
            exit();
        } else {
            return array(
                'success' => TRUE,
                'data' => $this->security->createCaptcha('code')
            );
        }
    }

}