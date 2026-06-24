#!/bin/bash

df -h | awk 'NR > 1 {print $5}' | tr -d "%" | while read use; do

	if [ $use -ge 80 ]; then
		echo "Aviso: particion al ${use}%"
	fi	
done
