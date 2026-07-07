#!/bin/bash

count_files(){	
	echo "Total files: "
	find $1 -maxdepth 1 -type f | wc -l
	echo "These are the files: "	
	find $1 -maxdepth 1 -type f	

}

count_files $1
