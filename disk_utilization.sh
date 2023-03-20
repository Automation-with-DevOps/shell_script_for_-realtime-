#!/bin/bash

WARN="4"

df -h / egrep -v "Filesystem|tmpfs" > /tmp/df.txt
while read C1 C2 C3 C4 C5 C6
do 
		CHK=`echo $C5 | cut -d'%' -f 1`
		if [[  $CHK -gt $WARN ]]
			then 
				echo -e "\n***************WARNING********************"
				echo -e "\nYour Disk utilization of $C6 is reached to threshold $C5"
			else 
				echo -e "\n your disk is under threshold $C5"
		fi

done< /tmp/df.txt

		