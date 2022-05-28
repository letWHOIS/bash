#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ns.sh softreck.com

# CONFIG
DOMAIN=$1
[ -z "$DOMAIN" ] && echo "DOMAIN NAME is empty" && exit

# START
REGISTER=$(php reverseIp.php $IP)
REGISTER=${REGISTER//,/$'\n'}
echo $REGISTER