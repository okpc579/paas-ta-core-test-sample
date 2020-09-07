#!/bin/bash

source variables.sh

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "spend time : %02d:%02d:%02d\n" $h $m $s
}

echo ""
echo "==========TEST_NAME=BOSH_VMS=========="

echo -e "start time : \c"
date
FIRST_DATE=`date "+%s"`
echo ""
bosh -e ${BOSH_Director_Name} -d paasta vms
echo ""

echo -e "end time : \c"
date
SECOND_DATE=`date "+%s"`

INTERVAL=`echo "(${SECOND_DATE} - ${FIRST_DATE} )  " | bc`
echo $(convertsecs $INTERVAL)

