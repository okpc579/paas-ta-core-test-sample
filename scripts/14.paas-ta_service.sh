#!/bin/bash

source variables.sh


convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_SERVICE=========="


echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`

echo ""

cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Create_User_ID} -p ${PaaSTA_Create_User_Password} -o ${Create_Org_Name} -s ${Create_Space_Name}
cf marketplace
cf create-service bookstore standard ${Create_Sevice}
cf services

echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

