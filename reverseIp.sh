#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./reverseIp.sh 108.174.10.10
# echo "108.174.10.10" | ./reverseIp.sh

# CONFIG
IP=
[ ! -t 0 ] && IFS='' read -d '' -r IP
[ ! -z "$1" ] && IP=$1
[ -z "$IP" ] && echo "IP is empty" && exit

# START
REVERSE_IP=$(php ./letwhois/reverseIp.php $IP)
REVERSE_IP=${REVERSE_IP//,/$'\n'}
echo $REVERSE_IP