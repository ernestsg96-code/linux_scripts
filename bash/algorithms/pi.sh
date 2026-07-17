#!/bin/bash
 
#ask user for input number and check non number cases
echo "Give me a number and we'll see if we can find it in the first 50 decimals of PI"
read -r n

if [[ -z $n ]]; then
	echo "We need a positive number friend"
	exit 1
elif [[ ! $n =~ ^[0-9]+$ ]]; then
	echo "We need a positive number friend"
	exit 2
fi

pi_decimals="14159265358979323846264338327950288419716939937510"

#create array of both the number input and pi decimals so that we can iterate
n_array=($(echo "$n" | grep -o .))
pi_array=($(echo "$pi_decimals" | grep -o .))

#outer loop to check each decimal
for (( i=0; i<=${#pi_array[@]} - ${#n_array[@]}; i++ )); do
	
	#set a variable to keep count of every match
	count=0

	#inner loop to check each one of the input digits vs the decimal we're at
	for (( j=0; j<${#n_array[@]}; j++ )); do
		
		#checks that the input number we're at matches the decimal we're at
		if [[ "${pi_array[i + j]}" == "${n_array[j]}" ]]; then
			
			#add 1 to count if a match is found
			(( count++ ))

			#checks that count and the length of the input number are the same and exits when found
			if (( count == ${#n_array[@]} )); then
				success=$(( i + 1 ))
				echo "Success. Our answer is found at index: $success"
				exit 0
			fi	
		else 
			#jumps straight to the next iteration of the outer loop when there's a mismatch
			break	
		fi
	done
done
 
#if we get here and no number has been found we've got bad news for you
echo "Sorry we couldn't find your number"	
