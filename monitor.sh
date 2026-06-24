#!/bin/bash

totalines=$(wc -l < /var/log/syslog)
errorlines=$(grep -ia "error" /var/log/syslog | wc -l)
last5=$(tail -n 5 /var/log/syslog)
echo "Lines: ${totalines}."
echo "ErrorLines: ${errorlines}"
echo "Last Five: "
echo "${last5}"
