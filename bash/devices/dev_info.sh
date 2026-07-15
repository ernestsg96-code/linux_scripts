#!/bin/bash

devices=("null" "zero" "random")

#show the file type for each device
for device in "${devices[@]}"; do
	file /dev/$device
done

#check how null destroys everything that goes into it
echo "This sentence will disappear into /dev/null" 
sleep 1
echo "This sentence will disappear into the /dev/null" > /dev/null
echo "Let's check it. Running a list of all files inside ..."
ls -la /dev/null

#Make some random numbers
echo "Give me some random numbers :)"
cat /dev/urandom | head -c 16 | xxd


