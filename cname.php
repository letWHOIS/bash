<?php

use React\Dns\Model\Message;
use React\Dns\Query\Query;
use React\Dns\Query\UdpTransportExecutor;
use React\EventLoop\Factory;
use React\Dns\Config\Config;
//use React\Dns\Resolver\Factory;


require __DIR__ . '/../reactphp/vendor/autoload.php';

$executor = new UdpTransportExecutor('8.8.8.8:53');

$name = isset($argv[1]) ? $argv[1] : 'www.google.com';

$ipv4Query = new Query($name, Message::TYPE_CNAME, Message::CLASS_IN);

$executor->query($ipv4Query)->then(function (Message $message) {
    foreach ($message->answers as $answer) {
        echo 'CNAME: ' . $answer->data . PHP_EOL;
    }
}, 'printf');

$promise = $resolver->resolveAll('reactphp.org', Message::TYPE_AAAA);

$promise->cancel();
