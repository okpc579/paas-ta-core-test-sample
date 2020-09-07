#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=BOSH_RELEASE=========="

echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`

echo ""
bosh -e ${BOSH_Director_Name} upload-release https://bosh.io/d/github.com/cloudfoundry/bosh-dns-release?v=1.12.0 -n
bosh -e ${BOSH_Director_Name} releases

echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)
