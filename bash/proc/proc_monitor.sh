#!/bin/bash

#checks that an argument is passed

if [ -z "$1" ] ; then 	
	echo "I need an argument my friend"
	exit 1

fi

#checks that the process exists and if it does it shows the required parameters
if [ -d "/proc/$1" ]; then
	grep -E "^Name|^State|^VmRSS|^Uid" /proc/$1/status
else
	echo "There's no such process with id: $1"
fi


