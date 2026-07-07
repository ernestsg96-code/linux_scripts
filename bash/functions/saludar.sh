#!/bin/bash

saludar(){
	read -p $'Hey there! Whats\'s your name? \n> ' name
	name="${name:-NAMELESS}" 
	echo "Well, $name it is a pleasure making you my acquaintance"

}
saludar
