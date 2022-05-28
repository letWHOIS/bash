#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 26.05.2022

## EXAMPLE
# ./ns.sh softreck.com

# START
REGISTER=$(php ./whois-registrar/check.php $DOMAIN)
REGISTER=${REGISTER//,/$'\n'}
echo $REGISTER