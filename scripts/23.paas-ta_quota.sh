#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_QUOTA=========="


echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`

echo ""

cf create-space-quota ${Create_Space_Quota} -m 1G -i 1G -r 10 -s 10
cf set-space-quota ${Create_Space_Name} ${Create_Space_Quota}
cf push -f ${Sample_Path}/paas-ta-apps/2.java_buildpack_sample/manifest.yml -m 2G
echo ""
echo "=================================================="
echo "APP PUSH FAILED CHECK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "=================================================="
echo ""
cf unset-space-quota ${Create_Space_Name} ${Create_Space_Quota}
cf push -f ${Sample_Path}/paas-ta-apps/2.java_buildpack_sample/manifest.yml -m 2G
echo ""
echo "=================================================="
echo "APP PUSH SUCCEED CHECK!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "=================================================="
echo ""

echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

