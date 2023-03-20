#!/bin/bash

TOTAL=`free -m | grep -v total | grep -v Swap | awk '{print $2}'`
USED=`free -m | grep -v total | grep -v Swap | awk '{print $3}'`


######## PERSCENTAGE CALCULATING FORMULA 
####### NUMBER * PERCENTAGE / 100 

EIGHTY_PERCENT=$((  TOTAL*80/100 ))

if [[ $USED -ge $EIGHTY_PERCENT ]]
	then 	
		echo -e "\n*****************ATTENTION IS NEEDED*****************"
		echo -e "\n Memory utilization is on `hostname` is reached to more then 80 %"
	else 
		echo -e "\n disk usage is normal on `hostname` "
fi		