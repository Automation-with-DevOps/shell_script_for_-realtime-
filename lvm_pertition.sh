write a shell script for creating lvm partition?


#!/bin/bash

LV_NAME=$1
LV_SIZE=$2
VG_NAME=$3
FILE_SYSTEM=$4
MOUNT_POINT=$5


if [[ $# -ne 5 ]]
then
     echo -e "Usage: $0 lvm_name lvm_size vg_name file_system mount_point"
	 exit 
fi

lvcreate -y --name $LV_NAME --size $LV_SIZE $VG_NAME > /dev/null 2>&1

if [[ $? -eq 0 ]]
then 
    echo -e "\n LVM /dev/$VG_NAME/$LV_NAME is created " 
	echo -e "\n Now formatting and mounting it "
	mkfs.$FILE_SYSTEM /dev/$VG_NAME/$LV_NAME > /dev/null 2>&1
	echo -e "\n creating dir for mounting the filesystem"
	mkdir -p $MOUNT_POINT
	echo -e "\n mounting the file_syetm on dir "
	mount /dev/$VG_NAME/$LV_NAME $MOUNT_POINT
	echo -e "\n adding the entry for file_system in /etc/fstab file "
	echo - e "/dev/$VG_NAME/$LV_NAME $MOUNT_POINT $FILE_SYSTEM default 0 0 " >> /etc/fstab
	echo -e "\n ====================`df -h $MOUNT_POINT `"
else
    echo -e "\n lvm is not created there is some issue in the script"
	exit
fi	