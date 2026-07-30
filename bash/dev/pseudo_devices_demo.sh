#!/bin/bash

#create an array for pseudo devices
pseudo_devices=("zero" "random" "urandom")

#iterate over every single pseudo device
for device in "${pseudo_devices[@]}"; do
	
	#save epochtime before creating test file
	init_time=$EPOCHREALTIME 2>/dev/null
	
	#create a test file of 10M filled with content produced by pseudo device 
	dd if=/dev/$device of=./tests/"${device}".img bs=1m count=10 2>/dev/null

	#save epochtime after test file is created
	end_time=$EPOCHREALTIME 2>/dev/null	

	#display a summary explaining how long each device took to create a test file
	echo "It takes $(echo $end_time - $init_time | bc)s for $device to fillup 10 megabytes in a file" 

done

