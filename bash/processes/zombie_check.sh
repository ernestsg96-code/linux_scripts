#!/bin/bash

zombies=$(ps aux | awk '$8~/Z/')
if [ -n "$zombies" ]; then
	echo "Zombie username, commandname: "
	echo "$zombies" | awk '{print $1, $11}'
else
	echo "None found "
fi
