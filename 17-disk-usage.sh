#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=''

while IFS= read line
do
    usage=$(echo df -hT | grep -vE 'tmp|File' | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo df -hT | grep -vE 'tmp|File' | awk '{print $1F}')
    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="\nHigh Disk Usage On $partition: $usage\n"
    fi
done <<< $DISK_USAGE

echo -e " Message: $message "
echo "$message Date $(date)" | mail -s "High Disk" rahula.24a@gmail.com
