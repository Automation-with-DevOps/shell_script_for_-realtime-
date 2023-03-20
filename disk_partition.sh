write a shell script for creating  partition?



#!/bin/bash

# Prompt the user for the disk device and partition number
read -p "Enter the disk device (e.g. /dev/sdb): " DISK
read -p "Enter the partition number (e.g. 1): " PARTITION_NUMBER

# Check if the disk device exists
if [ ! -b "$DISK" ]; then
    echo "Error: disk device $DISK does not exist."
    exit 1
fi

# Check if the partition number is valid
if [ "$PARTITION_NUMBER" -lt 1 ] || [ "$PARTITION_NUMBER" -gt 4 ]; then
    echo "Error: invalid partition number $PARTITION_NUMBER."
    exit 1
fi

# Prompt the user for the partition size and type
read -p "Enter the partition size in GB (e.g. 10): " PARTITION_SIZE
read -p "Enter the partition type (e.g. 83 for Linux): " PARTITION_TYPE

# Create a new partition using fdisk
echo "n
p
$PARTITION_NUMBER


+$PARTITION_SIZE"G
t
$PARTITION_NUMBER
$PARTITION_TYPE
w" | fdisk "$DISK"

# Print the partition table to verify the new partition

fdisk -l "$DISK"

	
	
	 
	 