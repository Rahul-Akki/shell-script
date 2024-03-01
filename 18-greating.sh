#!/bin/bash

person=""
WISH=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -W <wishes>" #basename $0 --> File name with out extension
    echo "Optiond ::"
    echo "-n, Specify the name (*)"
    echo "-w, Specify the wishes. ex, Good Morning"
    echo "-h, Display Help and exit."
}

while getopts ":n:w:h" opt; 
do  
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo " invalide options: -"$OPTARG"" >&2; USAGE; exit;;
        h|*) USAGE; exit;;
        :) USAGE; exit;;
    esac
done

if [ -z "$NAME" ] || [ -z "$WISHES" ]; then
    echo "Error: Both -n and -w are mandatory options."
    USAGE
    exit 1
fi

echo "Hello $NAME. $WISHES. I have been learning shell script."