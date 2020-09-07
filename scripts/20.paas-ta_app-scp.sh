#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_APP-SCP=========="


echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

APP_GUID=$(cf app PaaS-TA-java --guid)
SSH_CODE=$(cf ssh-code)
echo ${SSH_CODE}
scp -P 2222 -o User=cf:${APP_GUID}/0 ${Sample_Path}/etc/header-right.png ssh.${PaaSTA_Domain}:/home/vcap/app/WEB-INF/classes/static/images


echo ""
echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)


