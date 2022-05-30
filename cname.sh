#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ip.sh 8.8.8.8
# ./ip.sh 108.174.10.10

## EXAMPLE
# ./domainIp.sh softreck.com
# echo "softreck.com" | ./domainIp.sh

# CONFIG
DOMAIN=
[ ! -t 0 ] && IFS='' read -d '' -r DOMAIN
[ ! -z "$1" ] && DOMAIN=$1
[ -z "$DOMAIN" ] && echo "DOMAIN NAME is empty" && exit

# START
IP=$(php ./letwhois/cname.php $DOMAIN)
echo $IP
