#!/bin/bash 

for file in ~/scripts/*; do
	echo $file
	ls -l $file
	if [[ -x $file ]]; then
		echo "Es ejecutable"
	else
		echo "No es ejectuable"
	fi
done	
