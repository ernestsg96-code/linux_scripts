#!/bin/bash

dry_run=false
if [[ "$1" == "--dry-run" ]]; then
	dry_run=true
fi

run() {
	if [[ "$dry_run" == "true" ]]; then
		echo "[DRY RUN] $*"
	else
		"$@"
	fi
}

echo "Hello human, please enter the disk you'd like to partition
"

# common disk names, regardless of controller type
# sd[a-z] - SATA/ USB/ SCSI/ virtio-scsi
# nvme[0-9]n[0-9] - NVMe SSDs
# vd[a-z] - virtio blk
# mmcblk - SD cards / eMMC
# xvd[a-z] - Xen paravirtualized disk

disk_pattern="^(sd[a-z]|nvme[0-9]n[0-9]|vd[a-z]|mmcblk[0-9]|xvd[a-z])"
possible_partitions=("ext4" "btrfs" "xfs" "swap")
lsblk | grep -E "$disk_pattern"

echo ""

read -rp "User: " disk

echo ""

if [[ -z $disk ]]; then
	echo "You should provide a disk human"
	exit 1
elif [[ ! $disk =~ $disk_pattern  ]]; then
	echo "That's not a disk human"
	exit 2
else
	if sudo blkid -p -o value -s PTTYPE /dev/$disk > /dev/null 2>&1; then
		echo "This disk already has a partition table"

		##NEED TO CHECK FOR HOW BIG WAS THE LAST PARTITION AND DO CHECKS THAT THE NEW PARTITION ENTERS RIGHT AFTER THE LAST ONED
	else
		echo "Name your partition "
		partition_name=""
		until [[ $partition_name =~ ^[A-Za-z]+$ ]]; do

			echo "your name must only contain letters:
		       	"
			read -rp "User: " partition_name 
		done
		echo ""
		sleep 1
		echo "Your partition name is $partition_name, now tell me which partition type would you like?"

		for partition in "${possible_partitions[@]}"; do
			
			sleep 0.5
			echo $partition
		done
		
		echo ""
		
		match=false
		until [[ $match == true ]]; do
			echo "please choose from the options" 
			read -rp "
User: " partition_type

			match=false
			for (( i=0; i<${#possible_partitions[@]}; i++ )); do
				if [[ "${possible_partitions[i]}" == "$partition_type" ]]; then
				match=true
				fi
			done
		done

		echo "Your partition will be named $partition_name"

		echo "Now we're just missing the size of your partition"

		size_mb=$(( $(sudo lsblk -bdno SIZE /dev/$disk) / 1024 / 1024 ))


		partition_size=""
        	
		until [[ $partition_size =~ ^[0-9]+$ ]] && (( partition_size <= size_mb )); do
            		echo "bear in mind your disk holds ${size_mb}MB, only provide numbers"
            		read -rp "Size in MB: " partition_size
        	done

        	echo "Gotcha! Your partition will be $partition_size MB"
		

		run sudo parted -s /dev/$disk mklabel gpt mkpart $partition_name $partition_type 1MB ${partition_size}MB print

		run sudo cp /etc/fstab "/etc/fstab_backup_$(date +%Y%m%d_%H%M%S)"

		if [[ "$partition_type" == "swap" ]]; then
           	
		       	run sudo mkswap /dev/${disk}1
            		run sudo swapon /dev/${disk}1
            		disk_uuid=$(sudo blkid -o value -s UUID /dev/${disk}1)
           	 	run bash -c "echo 'UUID=$disk_uuid none swap sw 0 0' | sudo tee -a /etc/fstab > /dev/null"
        	else
            		run sudo mkfs -t "$partition_type" /dev/${disk}1
            		run sudo mkdir -p /mnt/$partition_name
            		disk_uuid=$(sudo blkid -o value -s UUID /dev/${disk}1)
            		run bash -c "echo 'UUID=$disk_uuid /mnt/$partition_name $partition_type defaults 0 2' | sudo tee -a /etc/fstab > /dev/null"

            		run sudo mount -fav
            		if (( $? == 0 )); then
                		run sudo mount -a
            		else
                		echo "fstab validation failed, check your entry before mounting"
                		exit 3
            		fi
		fi
        fi
fi
