
#!/bin/bash

files=$(ls ~ | wc -l)

if [ -d "/tmp/backup" ]; then
	cp -r ~/* /tmp/backup
	 echo "Dir already existed, ${files} copied"
else
	mkdir -p /tmp/backup
	cp -r ~/* /tmp/backup
	echo "Dir created, ${files} copied"
fi



