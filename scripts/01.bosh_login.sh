#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=BOSH_LOGIN=========="
echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

export BOSH_CA_CERT=$(bosh int ${BOSH_Path}/${IaaS}/creds.yml --path /director_ssl/ca)
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=$(bosh int ${BOSH_Path}/${IaaS}/creds.yml --path /admin_password)
export BOSH_ENVIRONMENT=${BOSH_Director_Name}
bosh env


echo ""


echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

