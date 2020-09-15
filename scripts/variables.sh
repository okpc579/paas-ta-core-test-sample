#!/bin/bash

# BOSH VARIABLES
BOSH_Director_Name="bosh-test"                  # e.g. micro-bosh
BOSH_Path="~/workspace/paasta-test/deployment/paasta-deployment/bosh"                           # e.g. ~/workspace/paasta-5.0/deployment/paasta-deployment/bosh
BOSH_IP="10.0.1.10"                                                                     # e.g. 10.0.1.6
IaaS="aws"                                                                      # e.g. aws/azure/gcp/openstack/vsphere

# PaaS-TA VARIABLES
PaaSTA_Domain="3.34.248.251.nip.io"                                     # e.g. 10.244.0.34.nip.io
PaaSTA_Admin_ID="admin"                         # e.g. admin
PaaSTA_Admin_Password="admin"   # e.g. admin
PaaSTA_Create_User_ID="testuser"        # e.g. test-user
PaaSTA_Create_User_Password="testpw"    # e.g. test-pw
Create_Org_Name="test-org"                                      # e.g. test-org
Create_Space_Name="test-space"                          # e.g. test-space
Sample_Path="/home/ubuntu/test_sample"                                     # e.g. ~/test_sample
Create_Space_Quota="test-space-quota"                  # e.g. test-space-quota
Create_Egov_Bulidpack="egov_39"            # e.g. egov_39
Create_Service_Broker="app-for-test-broker"            # e.g. bookstore
Create_Service_App="test-broker"                  # e.g. bookstore-service-broker
Create_Sevice="test-service"                            # e.g. my-bookstore
Create_Security_Group="test-security-group"            # e.g. test-security-group
DB_IP="10.0.31.203"		
DB_Port="3306"
