#!/bin/bash

#declare associative array
declare -A services=(["ssh"]=22 ["http"]=80 ["https"]=443 ["dns"]=53)

#iterate over the array using its key as reference
for service in "${!services[@]}"; do

	port=${services[$service]}

	#check for activity on each port
	if ss -ltn | grep -q ":$port"; then
		echo "$service (port $port) is listening"
	else
		echo "$service (port $port) is not listening"
	fi
	
done


