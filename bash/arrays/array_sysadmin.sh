#!/bin/bash

services=("ssh" "cron" "dbus" "network-dispatcher" "fwupd" "chrony")

for service in "${services[@]}"; do

	echo "Service: $service is $(systemctl is-active $service)"

done
