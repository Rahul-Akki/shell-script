#!bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "scrip started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILED $N"
    else
        echo -e "$2...$R SUCCESS $N"
    fi
}


ID=$(id -u) #--> Sudo access validation

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR : Please run this script with root access $N" 
    exit 1 # we can can give any number other than 0. -->   # EXIT STATUS --> echo $? = 0
else
    echo "Your are root user"
fi # fi indicates, end of if condition

#echo "All the arguments passed : $@"
#git mysql postfix
#package-git for first time.

for package in $@
do
    yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if installed
    then
        yum install $package -y &>> $LOGFILE #installing the package
        VALIDATE $? "INSTALLATION OF $package" #validate
    else
        echo -e "$package is already installed ... $Y SKIPPING $N"
    fi
done

