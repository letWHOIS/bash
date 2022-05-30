<?php

use React\Dns\Model\Message;
use React\Dns\Query\Query;
use React\Dns\Query\UdpTransportExecutor;
use React\EventLoop\Factory;

require __DIR__ . '/../reactphp/vendor/autoload.php';

$executor = new UdpTransportExecutor('8.8.8.8:53');

$name = isset($argv[1]) ? $argv[1] : 'www.google.com';

$ipv4Query = new Query($name, Message::TYPE_NS, Message::CLASS_IN);

$executor->query($ipv4Query)->then(function (Message $message) {
    foreach ($message->answers as $answer) {
        //echo 'NS: ' . $answer->data . PHP_EOL;
        echo '' . $answer->data . PHP_EOL;
    }
}, 'printf');

