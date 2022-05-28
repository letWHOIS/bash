#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ip.sh 8.8.8.8
# ./ip.sh 108.174.10.10

# CONFIG
DOMAIN=$1
[ -z "$DOMAIN" ] && echo "DOMAIN NAME is empty" && exit

# START
DOMAIN=$(php ip.php $DOMAIN)
echo $DOMAIN
exit

[ -t 0 ] && echo "stdin HTML Content is empty (cat index.html | ./tag.sh title)" && exit
IFS='' read -d '' -r HTML
[ -z "$1" ] && echo "HTML TAG is empty, (e.g.: title, body, header)" && exit
TAG=$1
echo "${HTML}" | sed -n "/${TAG}/{s/<${TAG}[^<]*>\([^<]*\)<.*/\1/;p;q}"
#echo "${HTML}" | sed -n "/<${tag}>/,/<\/${tag}>/p"
#sed -n "/<title>/,/<\/title>/p" index.html