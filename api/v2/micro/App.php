<?php
namespace Micro;

use Micro\Routing\Router;

class App extends \Phalcon\Mvc\Micro {

    private static $_defaultInstance;

    public function __construct($name) {
        $di = new \Phalcon\Di\FactoryDefault();

        $config = new \Phalcon\Config(array(
            'sys' => array(
                'name' => 'micro',
                'path' => __DIR__
            ),
            'app' => array(
                'name' => $name,
                'base' => '/api/v2/' . $name . '/',
                'path' => dirname(__DIR__) . '/app/' . $name . '/'
            ),
            'databases' => array()
        ));

        $di->set('config', $config, TRUE);

        $registry = new \Phalcon\Registry();
        $registry->modules = array();

        $di->set('registry', $registry, TRUE);

        require_once(__DIR__ . '/Http/Response.php');
        require_once(__DIR__ . '/Http/Request.php');
        require_once(__DIR__ . '/Security.php');
        require_once(__DIR__ . '/URL.php');

        $di->set('url', new URL(), TRUE);
        $di->set('request', new Http\Request());
        $di->set('response', new Http\Response());
        $di->set('security', new Security(), TRUE);

        $this->setDI($di);

        if ( ! self::$_defaultInstance) {
            self::$_defaultInstance = $this;
        }
    }

    public function run() {
        $this->_initialize();
        $this->_finalize();
    }

    private function _initialize() {
        // init config
        $this->_initConfig();

        // init loader
        $this->_initLoader();

        // init module
        $this->_initModule();

        // init router
        $this->_initRouter();

        // init provides (services)
        $this->_initProviders();

        // init database
        $this->_initDatabase();
    }

    private function _initConfig() {
        $folder = $this->config->app->path . 'config/';

        foreach(scandir($folder) as $file) {
            if ($file[0] == '.') continue;

            $data = include_once($folder . $file);
            $name = basename($file, '.php');
            
            if ($this->config->offsetExists($name)) {
                $config = new \Phalcon\Config($data);
                $this->config->{$name}->merge($config);
            } else {
                $this->config->offsetSet($name, $data);    
            }
        }

    }

    private function _initLoader() {
        $loader = new \Phalcon\Loader();

        $namespaces = array(
            'Micro' => array(__DIR__)
        );

        // composer
        $composer = $this->config->sys->path . '/../vendor/composer/';

        if (file_exists($composer) && is_dir($composer)) {
            $psr4 = require_once($composer . 'autoload_psr4.php');

            foreach($psr4 as $key => $val) {
                $key = rtrim($key, '\\');
                $psr4[$key] = $val;
            }

            $namespaces = array_merge($namespaces, $psr4);
        }

        $loader->registerNamespaces($namespaces)->register();

        // shortcut
        class_alias(\Micro\App::class, 'App');
        class_alias(\Micro\Routing\Router::class, 'Router');
        class_alias(\Micro\Controller::class, 'Controller');
        class_alias(\Micro\Model::class, 'Model');
        class_alias(\Micro\Http\Request::class, 'Request');
        class_alias(\Micro\Http\Response::class, 'Response');

        $this->getDI()->set('loader', $loader, TRUE);
    }

    private function _initModule() {
        $folder = new \DirectoryIterator($this->config->app->path . 'modules/');
        $namespaces = array();
        $modules = array();

        foreach($folder as $item) {
            $name = $item->getFilename();
            $path = $item->getPath();

            if ($name[0] == '.') continue;

            if ($item->isDir()) {
                $controllers = 'App\\' . $name . '\Controllers';
                $models = 'App\\' . $name . '\Models';

                $namespaces[$controllers] = array($path . '/' . $name . '/Controllers/');
                $namespaces[$models] = array($path . '/' . $name . '/Models/');

                $prefix = '/' . strtolower($name);
                
                foreach(scandir($namespaces[$controllers][0]) as $file) {
                    if ($file[0] == '.') continue;
                    $module = str_replace('Controller', '', basename($file, '.php'));
                    $module = \Phalcon\Text::uncamelize($module, '-');
                    $route = $prefix;

                    if ($module != strtolower($name)) {
                        $route = $prefix . '/' . $module;
                    }

                    $modules[$route] = $controllers . '\\' . basename($file, '.php');
                }
            }
        }

        $this->loader->registerNamespaces($namespaces, TRUE);
        $this->loader->register();

        // aliases from config
        if ($this->config->app->offsetExists('aliases')) {
            foreach($this->config->app->aliases as $alias => $class) {
                class_alias($class, $alias);
            }
        }

        $this->registry->modules = $modules;
    }

    private function _initRouter() {
        
        foreach($this->registry->modules as $path => $module) {
            Router::resource($path, $module)->setMiddleware('auth');
        }

        $folder = $this->config->app->path . 'routes/';

        foreach(scandir($folder) as $item) {
            if ($item[0] == '.') continue;
            require_once($folder . $item);
        }

        $this->notFound(function(){
            $response = $this->response;
            $response->setStatusCode(404, 'Not Found')->sendHeaders();
            $response->setContentType('application/json', 'UTF-8')->sendHeaders();
            
            print(json_encode(array(
                'success' => FALSE,
                'message' => 'The page you requested was not found'
            )));
        });
        
    }

    private function _initProviders() {
        $di = $this->getDI();

        $providers = array();
        $middleware = array();

        $providers = array_merge($providers, $this->config->app->providers->toArray());

        foreach($providers as $name => $class) {
            $di->set($name, function() use ($class){
                return new $class();
            }, TRUE);
        }

        $middleware = array_merge($middleware, $this->config->app->middleware->toArray());

        foreach($middleware as $name => $class) {
            $di->set($name.'_middleware', function() use ($class){
                return new $class();
            }, TRUE);
        }

    }

    private function _initDatabase() {
        $di = $this->getDI();

        foreach($this->config->databases as $name => $config) {
            $adapter = isset($config->type) ? ucwords($config->type) : 'Mysql';
            $adapter = '\Phalcon\Db\Adapter\Pdo\\' . $adapter;

            $options = array(
                'host' => $config->host,
                'username' => $config->user,
                'dbname' => $config->name
            );

            if (isset($optconfigs->port)) {
                $options['port'] = $config->port;
            }

            if (isset($config->pass)) {
                $options['password'] = $config->pass;
            }

            $database = new $adapter($options);

            // enabling nested transaction (mysql:innodb)
            $database->setNestedTransactionsWithSavepoints(TRUE);
            
            $di->set($name, $database);
        }
    }

    private function _finalize() {

        $app = $this;

        $app->before(function() use ($app) {
            $route = $app->getRouter()->getMatchedRoute();
            if (isset($route->_provider)) {
                $mware = $route->_provider->getMiddleware().'_middleware';
                if ($app->getDI()->has($mware)) {
                    $mware = $app->getDI()->get($mware, TRUE);
                    return $mware->authenticate();
                }
            }
            return TRUE;
        });

        $app->after(function() use ($app) {
            $data = $app->getReturnedValue();

            if (is_array($data) || is_object($data)) {
                $app->response->setContentType('application/json', 'UTF-8');
                $app->response->setContent(json_encode($data, JSON_PRETTY_PRINT));
            } else {
                $app->response->setContent($data);
            }
        });

        $app->finish(function() use ($app){
            if ( ! $app->response->isSent()) {
                $app->response->send();
            }
        });

        $this->handle();
    }

    public static function getDefault() {
        return self::$_defaultInstance;
    }

    public static function test() {
        
    }

}