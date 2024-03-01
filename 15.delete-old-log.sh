#!/bin/bash

SOURCE_DIR="temp/shellscript-logs"

if [ ! -d $SOURCE_DIR ]
then    
    echo "Source Directory : $SOURCE_DIR dose not exists "
fi
 
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

WHILE IFS=reaf -r line
do
    echo "Deleting file: $line"
    
done  <<< $FILES_TO_DELETE