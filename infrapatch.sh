#!/bin/bash
# ROUTER
DOMAIN=$1
[ -z "$DOMAIN" ] && DOMAIN="softreck.com"
[ $DOMAIN = "-params-line-in-csv-format" ] && echo "DOMAIN,HOST_IP,REVERSE_IP,REGISTER,NS" && exit
IP=$(php ip.php $DOMAIN)
NS=$(php ns.php $DOMAIN)
REVERSE_IP=$(php ./reactphp/examples/13-reverse-dns.php $IP)
REGISTER=$(php ./whois-registrar/check.php $DOMAIN)
REGISTER=${REGISTER//,/$'\n'}
OUT="$IP, $REVERSE_IP, $REGISTER, $NS"
echo "$DOMAIN, ${OUT##*( )}" | tr -s '\n ' ' '
echo ""
