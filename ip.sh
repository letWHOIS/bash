#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ip.sh 8.8.8.8

# CONFIG
IP=$1
[ -z "$IP" ] && echo "IP is empty" && exit

# START
IP=$(php ip.php $IP)
echo $IP
exit

[ -t 0 ] && echo "stdin HTML Content is empty (cat index.html | ./tag.sh title)" && exit
IFS='' read -d '' -r HTML
[ -z "$1" ] && echo "HTML TAG is empty, (e.g.: title, body, header)" && exit
TAG=$1
echo "${HTML}" | sed -n "/${TAG}/{s/<${TAG}[^<]*>\([^<]*\)<.*/\1/;p;q}"
#echo "${HTML}" | sed -n "/<${tag}>/,/<\/${tag}>/p"
#sed -n "/<title>/,/<\/title>/p" index.html