#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./reverseIp.sh 108.174.10.10

# CONFIG
IP=$1
[ -z "$IP" ] && echo "DOMAIN NAME is empty" && exit

# START
REGISTER=$(php reverseIp.php $IP)
REGISTER=${REGISTER//,/$'\n'}
echo $REGISTER