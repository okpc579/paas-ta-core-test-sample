#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_SECURITY-GROUP=========="


echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`

echo ""

cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Admin_ID} -p ${PaaSTA_Admin_Password} -o ${Create_Org_Name} -s ${Create_Space_Name}
cf create-security-group ${Create_Security_Group} ${Sample_Path}/etc/rule.json
cf security-groups
cf bind-running-security-group ${Create_Security_Group}
cf restart PaaS-TA-java
cf ssh PaaS-TA-java

echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

