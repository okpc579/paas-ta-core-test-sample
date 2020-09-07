#!/bin/bash

source variables.sh


convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=PaaS-TA_BUILDPACK=========="


echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`

echo ""

cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Create_User_ID} -p ${PaaSTA_Create_User_Password} -o ${Create_Org_Name} -s ${Create_Space_Name}
cf push -f ${Sample_Path}/paas-ta-apps/2.java_buildpack_sample/manifest.yml 
cf push -f ${Sample_Path}/paas-ta-apps/3.ruby_buildpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/3.ruby_buildpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/4.dotnet_core_buildpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/4.dotnet_core_buildpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/5.nodejs_buildpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/5.nodejs_buildpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/6.go_buildpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/6.go_buildpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/7.python_buldpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/7.python_buldpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/8.php_buldpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/8.php_buldpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/9.nginx_buldpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/9.nginx_buldpack_sample
cf push -f ${Sample_Path}/paas-ta-apps/10.binary_buldpack_sample/manifest.yml -p ${Sample_Path}/paas-ta-apps/10.binary_buldpack_sample/binary
cf push -f ${Sample_Path}/paas-ta-apps/11.egov_buldpack_sample/manifest.yml
cf apps

echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

