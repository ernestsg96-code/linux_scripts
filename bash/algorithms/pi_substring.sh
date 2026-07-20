#!/bin/bash

#prompt the user to choose a number
echo "Hello human, give me a number and I'll check whether it exist on the first 50 decimals of Pi or not"

read -r n

#ensure that the user inputs a number
if [[ -z $n ]]; then
	echo "I need a number human"
	exit 1
elif [[ ! $n =~ ^[0-9]+$ ]]; then
      echo "I need a number human"	
      exit 2
fi

pi_decimals="14159265358979323846264338327950288419716939937510"

#substring comparison, slicing a chunk of pi same length as n at each index and comparing them directy.
for (( i=0; i<=${#pi_decimals}-${#n}; i++ ));do
	if [[ "${pi_decimals:$i:${#n}}" == $n ]]; then
		echo "Success. Our answer is found at index: $(( i+1 ))"
		exit 0
	fi
done

echo "Sorry we couldn't find your number"
