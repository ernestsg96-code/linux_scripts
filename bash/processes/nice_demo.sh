#!/bin/bash

#get nice value from a PID function
get_nice(){
	ps -eo pid,ni,comm | grep $1 | awk '{print $2}'
}

#launch 2 processes with a desired nice values and save its nice value
nice -n 10 sleep 100 & 
first_proc_pid=$!
sleep 0.1
first_proc_nice=$(get_nice $first_proc_pid)


nice -n 15 sleep 150 & 
second_proc_pid=$!
sleep 0.1
second_proc_nice=$(get_nice $second_proc_pid)

#show the user what has been happening on the background
echo "These 2 processes have been launched:"
echo "PID: $first_proc_pid and  its niceness is: $first_proc_nice"
echo "PID: $second_proc_pid and its niceness is $second_proc_nice"

#adapt the nice value of the first process to lower its priority
renice 15 -p $first_proc_pid 1>/dev/null
echo "PID: $first_proc_pid and  its new niceness is: $(get_nice $first_proc_pid)"

#discard both processes
kill $first_proc_pid
kill $second_proc_pid
echo "Processes killed"
