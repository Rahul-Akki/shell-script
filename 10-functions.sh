#!bin/bash

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR : $2 ...failed"
        exit 1
    else
        echo "STATUS : $2 ...SUCCESS" 
    fi
}


# 1 --> Sudo access validation
ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR : Please run this script with root access" #stop --> clear the error --> then proceed to next step
    exit 1 # we can can give any number other than 0. -->   # EXIT STATUS --> echo $? = 0

             #shell scrip will not stop if we get an error. Its our responsibility to check and proceed the script. 
           
else
    echo "Your are root user"
fi          # fi is used to end the if condition

            
# 2 --> MySQL installation

yum install mysql -y 

VALIDATE $? "MySQL Installation"

yum install git -y

VALIDATE $? "GIT Installation"
