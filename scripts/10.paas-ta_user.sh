#!/bin/bash

source variables.sh


convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_USER=========="

echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Admin_ID} -p ${PaaSTA_Admin_Password} -o system
cf create-user ${PaaSTA_Create_User_ID} ${PaaSTA_Create_User_Password}
cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Create_User_ID} -p ${PaaSTA_Create_User_Password}

echo ""
echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

