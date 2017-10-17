<?php
namespace Micro\Auth;

class AuthProvider extends \Micro\Component {

    protected $_providers;
    protected $_error;
    protected $_captcha;

    public function __construct() {
        $config = $this->getApp()->config->auth;

        $this->_providers = $config->providers;
        $this->_captcha = $config->captcha;
    }

    protected function _run($class, $method, $args = array()) {
        return call_user_func_array(array($class, $method), $args);
    }

    protected function _findUserByEmail($email) {
        return $this->_run($this->_providers->user, 'findFirstByEmail', array($email));
    }

    public function isCaptchaEnabled() {
        return $this->_captcha->enabled === TRUE;
    }

    public function id($token = NULL) {
        $user = $this->user($token);
        return $user ? $user['id'] : NULL;
    }

    public function user($token = NULL, $model = FALSE) {
        static $user;
        static $userModel;

        if (empty($token)) {
            if (is_null($user)) {
                
                $user = FALSE;
                $userModel = FALSE;

                $token = $this->token();

                if ($token) {
                    try {
                        $decode = $this->security->decodeToken($token);
                        $userModel = $this->_findUserByEmail($decode->data->su_email);
                        
                        if ($userModel) {
                            $user = $userModel->toArray();
                            unset($user['su_passwd']);
                        }
                    }  catch(\Exception $ex) {}
                }
            }
            
            return $user ? ($model ? $userModel : $user) : NULL;

        } else {
            
            $array = NULL;
            $record = NULL;

            try {
                $decode = $this->security->decodeToken($token);
                $record = $this->_findUserByEmail($decode->data->su_email);
                
                if ($record) {
                    $array = $record->toArray();
                    unset($array['su_passwd']);
                }
            }  catch(\Exception $ex) {}

            return $model ? $record : $array;
        }
    }

    public function guest() {
        
    }

    public function validate($token = NULL) {
        if ( ! $token) {
            $token = $this->token();    
        }
        
        if ($token) {
            try {
                $this->security->decodeToken($token);
                return TRUE;
            } 
            catch(\Exception $ex) {}
        }

        return FALSE;
    }

    public function login($email, $password, $remember = FALSE) {
        $user = $this->_findUserByEmail($email);

        if ( ! $user) {
            $this->_error = 'User not found!';
            return FALSE;
        }

        if ( ! $user->su_active) {
            $this->_error = 'User currently blocked';
            return FALSE;
        }

        if ( ! $this->security->verifyHash($password, $user->su_passwd)) {
            $this->_error = 'Invalid email or password!';
            return FALSE;
        }

        $user->su_access_token = $this->security->createToken(array(
            'su_email' => $user->su_email,
            'su_sr_id'  => $user->su_sr_id
        ));

        $user->su_refresh_token = $this->security->createToken(NULL, 108000);
        $user->save();

        $user = $user->toArray();
        
        unset($user['su_refresh_token']);
        unset($user['su_passwd']);

        return $user;
    }

    public function logout() {
        
    }

    public function token() {
        $token = $this->request->getQuery('access_token');

        if (empty($token)) {
            $header = $this->request->getHeader('Authorization');

            if (preg_match('/Bearer\s+(.*)/', $header, $matches)) {
                $token = $matches[1];
            }
        }

        return empty($token) ? NULL : $token;
    }

    public function error() {
        return $this->_error;
    }

}