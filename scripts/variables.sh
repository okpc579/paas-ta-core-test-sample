#!/bin/bash

# BOSH VARIABLES
BOSH_Director_Name="<BOSH_Director_Name>"			# e.g. micro-bosh
BOSH_Path="<BOSH_Deployment_File_Path>"				# e.g. /home/ubuntu/workspace/paasta-5.0/deployment/paasta-deployment/bosh
BOSH_IP="<BOSH_IP>"						# e.g. 10.0.1.6
IaaS="<IaaS_Name>"						# e.g. aws/azure/gcp/openstack/vsphere

# PaaS-TA VARIABLES
PaaSTA_Domain="<PaaS-TA_domain>"				# e.g. 10.244.0.34.nip.io
PaaSTA_Admin_ID="<PaaS-TA_Admin_ID>"				# e.g. admin
PaaSTA_Admin_Password="<PaaS-TA_Admin_Password>"		# e.g. admin
PaaSTA_Create_User_ID="<PaaS-TA_Create_User_ID>"		# e.g. test-user
PaaSTA_Create_User_Password="<PaaS-TA_Create_User_Password>"	# e.g. test-pw
Create_Org_Name="<Create_Org_Name>"				# e.g. test-org
Create_Space_Name="<Create_Space_Name>"				# e.g. test-space
Sample_Path="<Sample_File_Path>"				# e.g. /home/ubuntu/test_sample
Create_Space_Quota="<Create_Space_Quota_Name>"			# e.g. test-space-quota
Create_Egov_Bulidpack="<Create_Egov_Bulidpack_Name>"		# e.g. egov_39
Create_Service_App="<Create_Service_App_Name>"                  # e.g. app-for-test-broker
Create_Service_Broker="<Create_Service_Broker_Name>"		# e.g. test-broker
Create_Sevice="<Create_Sevice_Name>"				# e.g. test-service
Create_Security_Group="<Create_Security_Group_Name>"		# e.g. test-security-group
