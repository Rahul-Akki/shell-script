#!bin/bash

# 1 --> Sudo access validation
ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "ERROR : Installing is failed"
        exit 1
    else
        echo "STATUS : Installing is SUCCESS" 
    fi
}

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

VALIDATE

yum install git -y

VALIDATE
