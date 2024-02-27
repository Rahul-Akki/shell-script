#!bin/bash

ID=$(id -u) # 1 --> Sudo access validation
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){ #3 --> Validation function and call it whenever required.
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR : $2 ...$R failed $N"
        exit 1
    else
        echo -e "STATUS : $2 ...$G SUCCESS $N" 
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR : Please run this script with root access $N"
    exit 1 
else
    echo "Your are root user"
fi 

yum install mysql -y &>> $LOGFILE # 2 --> MySQL installation

VALIDATE $? "MySQL Installation"

yum install git -y &>> $LOGFILE

VALIDATE $? "GIT Installation"
