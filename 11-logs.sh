#!bin/bash

VALIDATE(){ #3 --> Validation function and call it whenever required.
    if [ $1 -ne 0 ]
    then
        echo "ERROR : $2 ...failed"
        exit 1
    else
        echo "STATUS : $2 ...SUCCESS" 
    fi
}


ID=$(id -u) # 1 --> Sudo access validation
TIMESTAMP=$(date)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
    echo "ERROR : Please run this script with root access"
    exit 1 
else
    echo "Your are root user"
fi 

yum install mysql -y & >> $LOGFILE # 2 --> MySQL installation

VALIDATE $? "MySQL Installation"

yum install git -y & >> $LOGFILE

VALIDATE $? "GIT Installation"
