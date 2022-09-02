<?php

/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */
return array(
    'db' => array(
        'adapters' => array(
            'pajakdb' => array(
                'driver' => 'Pgsql',
                'database' => 'simpatda_pulpis',
                'hostname' => 'localhost',
                'username' => 'postgres',
                'password' => 'postgres',
            ),
            'bphtbdb' => array(
                'driver' => 'Pgsql',
                'database' => 'bphtb_pulpis',
                'hostname' => 'localhost',
                'username' => 'postgres',
                'password' => 'postgres',
            ),
            'pbbdb' => array(
                'driver' => 'OCI8',
                'character_set' => 'AL32UTF8',

                'connection_string' => '192.168.56.2/SIMPBB',
                // 'dsn' => 'oracle:dbname=SIMPBB;host=192.168.3.253/SIMPBB',
                // 'character_set' => 'AL32UTF8',
                'username' => 'DEVPPLS',
                // 'password' => 'Z2184SDNHGF8121RT58',
                'password' => 'DEVPPLS',

            )
        ),
        'options' => array(
            'buffer_results' => true
        ),
    ),
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Db\Adapter\AdapterAbstractServiceFactory',
        ),
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory',
        ),
    ),
);
