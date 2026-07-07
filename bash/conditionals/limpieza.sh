#!/bin/bash
ficheros=$(find /tmp -type f -mtime 0 2> /dev/null)

if [ -z "$ficheros" ]; then
	echo " Error: No file found"
	exit 1
else 
	echo "Here you go, these are your files"
	echo "$ficheros"
fi

read -p "Want to delete? y/n: "

if [[ "$REPLY" == "y" ]]; then
	echo "$ficheros" | xargs rm
	echo " deleted"
elif [[ "$REPLY" == "n" ]]; then
	echo "No files deleted"
else
	echo "Please only enter y or n"
fi
