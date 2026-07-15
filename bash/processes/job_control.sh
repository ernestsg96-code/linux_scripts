#!/bin/bash

#run processes in the background with a wait of half a second in between
sleep 1000 &
sleep 0.5
sleep 1001 &
sleep 0.5
sleep 1002 &
sleep 0.5

#check that the processes are running correctly
jobs

#kill one by one each process with a wait of half a second in between
kill %1
sleep 0.5
kill %2
sleep 0.5
kill %3
sleep 0.5

#check that all processes have been killed
jobs
