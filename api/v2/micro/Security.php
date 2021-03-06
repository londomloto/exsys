<?php
namespace Micro;

class Security extends \Phalcon\Security {

    private static $__captcha;

    public function __construct() {
        parent::__construct();
    }

    public function getApp() {
        return \Micro\App::getDefault();
    }

    public function createCaptcha($type = 'image') {
        $this->__initializeCaptcha();

        if (self::$__captcha ===  FALSE) {
            throw new \Exception('Unable to generate security code');
        }

        $captcha = self::$__captcha;

        $captcha->charset = 'abcdefghklmnprstuvwyz';
        $captcha->code_length = 3;
        $captcha->perturbation = 0.1;
        $captcha->num_lines = 0;
        $captcha->image_width = 120;
        $captcha->image_height = (int)($captcha->image_width * 0.35);

        if ($type == 'image') {

            $captcha->show();
        } else {
            $captcha->createCode();
            return $captcha->getCode();
        }
    }

    public function verifyCaptcha($code) {
        $this->__initializeCaptcha();

        // captcha not supported
        if (self::$__captcha === FALSE) {
            return TRUE;
        }

        return self::$__captcha->check($code);
    }

    public function createToken($payload = array(), $timeout = NULL) {
        $time = time();
        $config = $this->getApp()->config->app;

        if (is_null($timeout)) {
            $timeout = 28000;
        }

        $options = array(
            'iat' => $time,
            'jti' => base64_encode(mcrypt_create_iv(32, MCRYPT_DEV_URANDOM)),
            'iss' => $config->author,
            'nbf' => $time + 1,
            'exp' => $time + 1 + $timeout
        );

        $options['data'] = $payload;

        $token = \Firebase\JWT\JWT::encode($options, $config->secret, 'HS512');

        return $token;
    }

    public function decodeToken($token) {
        $config = $this->getApp()->config->app;
        return \Firebase\JWT\JWT::decode($token, $config->secret, array('HS512'));    
    }

    public function verifyToken($token) {

        $config = $this->getApp()->config->app;

        $result = array(
            'success' => TRUE,
            'status' => 'valid',
            'message' => NULL,
            'payload' => array()
        );

        try {

            $decoded = \Firebase\JWT\JWT::decode($token, $config->secret, array('HS512'));
            $result['payload'] = $decoded->data;

        } catch(\Firebase\JWT\BeforeValidException $e) {

            $result['success'] = FALSE;
            $result['status'] = 'pending';
            $result['message'] = $e->getMessage();

        } catch(\Firebase\JWT\ExpiredException $e) {

            $result['success'] = FALSE;
            $result['status'] = 'expired';
            $result['message'] = $e->getMessage();

        } catch(\Exception $e) {
            $result['success'] = FALSE;
            $result['status'] = 'invalid';
            $result['message'] = 'Invalid token format';
        }

        return $result;
    }

    public function createHash($password) {
        return $this->hash($password);
    }

    public function verifyHash($password, $hashed) {
        return $this->checkHash($password, $hashed);
    }

    public function createRandom($length = 16) {
        return $this->getRandom()->base64($length);
    }

    public function createPassword($length = 8) {
        return $this->getRandom()->base58($length);
    }

    public function encrypt() {

    }

    public function decrypt() {

    }

    private function __initializeCaptcha() {
        if (is_null(self::$__captcha)) {
            $app = $this->getApp();
            $cfg = $app->config->auth->captcha;

            if ( ! $cfg->enabled) {
                self::$__captcha = FALSE;
                return;
            }

            if ( ! $cfg->offsetExists('database')) {
                self::$__captcha = FALSE;
                throw new \Exception('Invalid captcha database connection');
            }

            if ($app->config->databases->offsetExists($cfg->database)) {
                $dbc = $app->config->databases->{$cfg->database};
                
                if ($dbc->offsetExists('type') && $dbc->type != 'mysql') {
                    self::$__captcha = FALSE;
                    throw new \Exception('Unsupported captcha storage type');
                }
                
                $tab = $cfg->offsetExists('table') ? $cfg->table : 'sys_captcha';
                
                require_once('../../../vendor/dapphp/securimage/securimage.php');

                $options = array(
                    'no_session' => TRUE,
                    'use_database' => TRUE,
                    'database_driver' => \Securimage::SI_DRIVER_MYSQL,
                    'database_host' => $dbc->host,
                    'database_user' => $dbc->user,
                    'database_pass' => $dbc->pass,
                    'database_name' => $dbc->name,
                    'database_table' => $tab
                );

                self::$__captcha = new \Securimage($options);
            } else {
                self::$__captcha = FALSE;
                throw new \Exception('Invalid captcha database connection');
            }
        }
    }
}