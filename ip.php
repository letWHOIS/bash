<?php

use React\Dns\Config\Config;
use React\Dns\Resolver\Factory;

require __DIR__ . '../php/reactphp/vendor/autoload.php';

//#if (!empty($argv[1])) {
//#  parse_str($argv[1], $_GET);
//#}
//var_dump($argv);

$domain=$argv[1];
if ( empty( $domain ) ) {
    $domain="softreck.com";
}

$config = React\Dns\Config\Config::loadSystemConfigBlocking();
if (!$config->nameservers) {
    $config->nameservers[] = '8.8.8.8';
}

$factory = new React\Dns\Resolver\Factory();
$dns = $factory->create($config);

//echo "$domain,";
$dns->resolve($domain)->then(function ($ip) {
    //echo "$ip\n";
    echo "$ip";
});