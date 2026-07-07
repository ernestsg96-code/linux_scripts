#!/bin/bash

while true; do	
	cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}' | tr -d " ")
	
	cpu_used=$(echo "100 - $cpu_idle" | bc)
	
	if (( $(echo "$cpu_used > 80" | bc -l) )); then	
		echo "CPU overcharged: $cpu_used used"
	fi
	sleep 5	
	done
