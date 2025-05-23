<?php

/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
$php_version = (int) substr(PHP_VERSION_ID, 0, 3);
if ($php_version >= 506) {
    date_default_timezone_set('Asia/Jakarta');
}
//chdir(dirname(__DIR__));
// ini_set('display_errors', true);
// error_reporting(E_ALL);
// Decline static file requests back to the PHP built-in webserver
if (php_sapi_name() === 'cli-server') {
    $path = realpath(__DIR__ . parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
    if (__FILE__ !== $path && is_file($path)) {
        return false;
    }
    unset($path);
}

// Setup autoloading
require 'init_autoloader.php';

// Run the application!
Zend\Mvc\Application::init(require 'config/application.config.php')->run();
