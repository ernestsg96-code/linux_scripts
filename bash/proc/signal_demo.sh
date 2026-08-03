#!/bin/bash

find ~ -name "signal_handler.py" | xargs python3 &
signal_handler_pid=$(ps aux | grep "signal_handler.py" | grep -v grep | awk '{print $2}')
echo "Process executed and running in the background. PID: $signal_handler_pid"

sleep 3

kill -1 $signal_handler_pid
echo "Reloading configuration"

sleep 2

kill $signal_handler_pid

sleep 2

if kill -0 $signal_handler_pid 2>/dev/null; then kill -9 $signal_handler_pid
	echo "Process had to be forcefully killed, due ignoring a call for termination"
else
	echo "Process terminated safely"
fi
