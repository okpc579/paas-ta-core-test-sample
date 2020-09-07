#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}


echo ""
echo "==========TEST_NAME=BOSH_STEMCELL=========="
echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""

if [[ ${IaaS} = 'aws' ]]; then
	bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/315.64/bosh-stemcell-315.64-aws-xen-hvm-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = 'azure' ]]; then
	bosh -e ${BOSH_Director_Name} upload-stemcell https://bosh-core-stemcells.s3-accelerate.amazonaws.com/315.64/bosh-stemcell-315.64-azure-hyperv-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = 'gcp' ]]; then
	bosh -e ${BOSH_Director_Name} upload-stemcell https://bosh-core-stemcells.s3-accelerate.amazonaws.com/315.64/bosh-stemcell-315.64-google-kvm-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = 'openstack' ]]; then
	bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/315.64/bosh-stemcell-315.64-openstack-kvm-ubuntu-xenial-go_agent.tgz -n
else
	bosh -e ${BOSH_Director_Name} upload-stemcell upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/315.64/bosh-stemcell-315.64-vsphere-esxi-ubuntu-xenial-go_agent.tgz -n
fi

bosh -e ${BOSH_Director_Name} stemcells

echo ""
echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

