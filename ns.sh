#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ns.sh softreck.com
# echo "softreck.com" | ./ns.sh

# CONFIG
DOMAIN=
[ ! -t 0 ] && IFS='' read -d '' -r DOMAIN
[ ! -z "$1" ] && DOMAIN=$1
[ -z "$DOMAIN" ] && echo "DOMAIN NAME is empty" && exit

# START
NS=$(php ./letwhois/ns.php $DOMAIN)
echo $NS