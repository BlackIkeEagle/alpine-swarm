<?php
return array (
  'backend' =>
  array (
    'frontName' => 'admin',
  ),
  'crypt' =>
  array (
    'key' => '3d1c191e2a90e170492a5fd8d2b221ed',
  ),
  'db' =>
  array (
    'table_prefix' => '',
    'connection' =>
    array (
      'default' =>
      array (
        'host' => 'mysql',
        'dbname' => 'magento2',
        'username' => 'root',
        'password' => 'toor',
        'model' => 'mysql4',
        'engine' => 'innodb',
        'initStatements' => 'SET NAMES utf8;',
        'active' => '1',
      ),
    ),
  ),
  'resource' =>
  array (
    'default_setup' =>
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'MAGE_MODE' => 'production',
  'session' =>
  array (
    'save' => 'redis',
    'redis' =>
    array (
      'host' => 'redis',
      'port' => '6379',
      'password' => '',
      'timeout' => '2.5',
      'persistent_identifier' => '',
      'database' => '0',
      'compression_threshold' => '2048',
      'compression_library' => 'gzip',
      'log_level' => '3',
      'max_concurrency' => '6',
      'break_after_frontend' => '5',
      'break_after_adminhtml' => '30',
      'first_lifetime' => '600',
      'bot_first_lifetime' => '60',
      'bot_lifetime' => '7200',
      'disable_locking' => '0',
      'min_lifetime' => '60',
      'max_lifetime' => '2592000',
      'use_lua' => 1,
    ),
  ),
  'cache' =>
  array (
    'frontend' =>
    array (
      'default' =>
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' =>
        array (
          'server' => 'redis',
          'database' => '2',
          'port' => '6379',
          'use_lua' => 1,
        ),
      ),
      'page_cache' =>
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' =>
        array (
          'server' => 'redis',
          'port' => '6379',
          'database' => '3',
          'compress_data' => '0',
          'use_lua' => 1,
        ),
      ),
    ),
  ),
  'cache_types' =>
  array (
    'config' => 1,
    'layout' => 1,
    'block_html' => 1,
    'collections' => 1,
    'reflection' => 1,
    'db_ddl' => 1,
    'eav' => 1,
    'customer_notification' => 1,
    'full_page' => 1,
    'config_integration' => 1,
    'config_integration_api' => 1,
    'translate' => 1,
    'config_webservice' => 1,
    'compiled_config' => 1,
  ),
  'install' =>
  array (
    'date' => 'Sun, 21 Jan 2018 17:39:24 +0000',
  ),
);
