#!/bin/bash

#gets all processes states and counts how many of each there are
states=$(ps -eo s | sort | uniq -c | sort -rn) 

echo "$states"

#check if there are any zombie or unstoppable processes runnin

if echo $states | grep -q "D" && echo $states | grep -q "Z" ; then
	echo "There is an unstoppable process running and on top of that we've got zombies coming our way"
elif echo $states | grep -q "D" ; then
	echo "There is an unstoppable process running" 

elif echo $states | grep -q "Z" ; then
	echo "We've got zombies coming our way"
else
	echo "Road is clear"
fi



