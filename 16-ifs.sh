#!/bin/bash

file=/etc/passwd

if [ ! -f &file ] # ! denotes opposite
then
    echo -e " $R Source directory: $file does not exists. $N "
fi
 
while IFS=":" read -r username password user_id group_id user_fullname home_dir
do
    echo "Username: $username"
    echo "User ID: $user_id"
    echo "User Full name: $user_fullname"
done < $file
