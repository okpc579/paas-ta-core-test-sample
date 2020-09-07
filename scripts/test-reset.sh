#!/bin/bash

source variables.sh

cf login -a https://api.${PaaSTA_Domain} --skip-ssl-validation -u ${PaaSTA_Admin_ID} -p ${PaaSTA_Admin_Password} -o ${Create_Org_Name} -s ${Create_Space_Name}

cf delete -f PaaS-TA-staticfile
cf delete -f PaaS-TA-java
cf delete -f PaaS-TA-ruby
cf delete -f PaaS-TA-dotnet-core
cf delete -f PaaS-TA-nodejs
cf delete -f PaaS-TA-go
cf delete -f PaaS-TA-python
cf delete -f PaaS-TA-php
cf delete -f PaaS-TA-nginx
cf delete -f PaaS-TA-binary
cf delete -f PaaS-TA-egov-3.9

cf delete-space-quota -f ${Create_Space_Quota}
cf delete-buildpack -f ${Create_Egov_Bulidpack} 
cf delete-service -f ${Create_Sevice}
cf delete-service-broker -f ${Create_Service_Broker}
cf delete -f ${Create_Service_App}
cf delete-space -f ${Create_Space_Name} -o ${Create_Org_Name}
cf delete-org -f ${Create_Org_Name}
cf delete-user -f ${PaaSTA_Create_User_ID}
cf delete-security-group ${Create_Security_Group} -f

bosh -d ${BOSH_Director_Name} delete-config --type='cloud' --name='test-cloud-config' -n
bosh -d ${BOSH_Director_Name} delete-config --type='runtime' --name='test-runtime-config' -n

