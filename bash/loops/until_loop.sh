#!/bin/bash

until ping -q -c1 8.8.8.8 > /dev/null 2>&1; do

	echo "Ping isn't working"	
	sleep 3
done

echo "Ping worked"
