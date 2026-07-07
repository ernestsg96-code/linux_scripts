#!/bin/bash

phrase=""

echo $phrase

echo ${phrase:-"thisisadefaultname"} # sets a default in case variable is empty
echo ${phrase:="thisisTHEdefaultname"} # sets the variable content to the same as the default it's giving

echo $phrase 

echo ${#phrase} # length of the variable

echo ${phrase##*THE}  # cuts everything from the begining until "THE"
echo ${phrase%%THE*}  # cuts everything from THE until the end 

echo ${phrase//is/os}  # replaces all "is" ocurrences for "os"

echo ${phrase^^} # turns into CAPS
echo ${phrase,,} # turns into lowercase

echo ${phrase:4:8} # extract 8 character from character in position 4 
