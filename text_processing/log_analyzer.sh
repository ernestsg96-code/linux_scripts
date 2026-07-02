#!/bin/bash

echo "Line total:"
cat /var/log/syslog | wc -l

echo "At these times we had the most activity:"
cut -dT -f2 /var/log/syslog | cut -d: -f1 | sort | uniq -c | sort -rn | head -5

echo "These are the words that appear the most: "
awk '{for(i=1;i<=NF;i++) print $i}' /var/log/syslog | sort | uniq -c | grep -v "homelandsecurity" | grep -v "-" | sort -rn | head -5

