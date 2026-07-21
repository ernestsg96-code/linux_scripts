#!/bin/bash

#declare an associative array to store each device
declare -A devices

#iterate over each device to get the information we require
for dir in /sys/block/*; do
	
	#store each devices name and size into variable
	name=$(basename "$dir")
	size_sectors=$(cat $dir/size)
	true_size=$(( size_sectors * 512 ))
	
	#check removability
	if [[ "$(cat $dir/removable)" == "1" ]]; then
		
		devices["$name"]="is removable"		

	elif [[ "$(cat $dir/removable)" == "0" ]]; then
		
		devices["$name"]="is not removable"

	else
		echo "Unexpected output"
		exit 1
	fi
	
	#display a summary of the requested data
	echo "Disk: $name major: minor are $(cat $dir/dev) ${devices["$name"]}, and of size: $(( true_size / 1024 /1024 /1024 )) GB" 

done
