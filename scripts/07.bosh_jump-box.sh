#!/bin/bash

source variables.sh


convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=BOSH_JUMP-BOX=========="
echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

bosh int ${BOSH_Path}/${IaaS}/creds.yml --path /jumpbox_ssh/private_key > jumpbox.key
chmod 600 jumpbox.key
#ssh jumpbox@${BOSH_IP} -i jumpbox.key "bash -s"
ssh jumpbox@${BOSH_IP} -i jumpbox.key "bash -s" -- < ./ssh-help.sh "sudo" "/var/vcap/bosh/bin/monit" "summary"


echo ""
echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)
