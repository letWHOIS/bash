#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./register.sh softreck.com
# echo "softreck.com" | ./register.sh

# CONFIG
DOMAIN=
[ ! -t 0 ] && IFS='' read -d '' -r DOMAIN
[ ! -z "$1" ] && DOMAIN=$1
[ -z "$DOMAIN" ] && echo "DOMAIN NAME is empty" && exit

# START
REGISTER=$(php ./whois-registrar/check.php $DOMAIN)
REGISTER=${REGISTER//,/$'\n'}
echo $REGISTER