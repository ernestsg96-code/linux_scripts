#!/bin/bash

#create fruit array
array=("mango" "banana" "kiwi")

echo ${array[0]}
echo ${array[2]}

echo "This is a divider"

#loop through the array
for fruit in "${array[@]}"; do
	echo $fruit
done

#display the array's length
echo "This array has ${#array[@]} fruits"

#append an element to the array	
array+=("pineapple")
echo "${array[3]} has been added to the collection"

#create an associative array
declare -A mango=(["colour"]="yellow" ["shape"]="round" ["flavour"]="sweet")

echo "A mango is ${mango[flavour]}"




