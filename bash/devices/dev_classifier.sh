#!/bin/bash

#delare associative array with types of devices
declare -A counts=(["character"]=0 ["block"]=0 ["pipe"]=0 ["socket"]=0 ["directory"]=0 ["link"]=0 ["other"]=0)

#iterate over each file/directory inside of /dev
for device in /dev/*; do
	
	#save the metadata of each file/directory inside the line variable
	line=$(ls -ld "$device")

	#remove everything from the metadata except for the first character, which indicates the type of file	
	first_ch=$(echo "$line" | cut -c 1)
	
	#check for each case to which type it corresponds and add to its respective counter
	case "$first_ch" in
		c)
			(( counts[character] += 1 ))
		 ;;
		b)
			(( counts[block] += 1 ))
		 ;;
	 	p)
			(( counts[pipe] += 1 ))
		 ;;
 		s)
			(( counts[socket] += 1 ))
		 ;;
		l)
			(( counts[link] += 1 ))
		 ;;
		d)
			(( counts[directory] += 1 ))
		 ;;
		*)
			(( counts[other] += 1 ))
       			echo "This is the first character for this line: $first_ch"
		 ;;
	esac
done

#display on screen the counts for each device type respectively
for type in "${!counts[@]}"; do
	count=${counts[$type]}
	
	if [[ $type == "link" ]]; then
		echo "symbolic $type: $count"
	elif [[ $type == "directory" ]]; then
		echo "$type: $count"
	else	
		echo "$type device: $count"
	fi

done	

