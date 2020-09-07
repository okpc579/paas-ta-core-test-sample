#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=BOSH_CREDHUB=========="
echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

export CREDHUB_CLIENT=credhub-admin
export CREDHUB_SECRET=$(bosh int --path /credhub_admin_client_secret ${BOSH_Path}/${IaaS}/creds.yml)
export CREDHUB_CA_CERT=$(bosh int --path /credhub_tls/ca ${BOSH_Path}/${IaaS}/creds.yml)
credhub login -s https://${BOSH_IP}:8844 --skip-tls-validation
credhub find

echo ""
echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

