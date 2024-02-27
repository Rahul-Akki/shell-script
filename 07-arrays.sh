#!/bin/bash

FRUITS=("Apple" "Banana" "Mango") # Array --> Attaching multiple values to the singlr variple

echo "First value: ${FRUITS[0]}"  # Index will be from 0 in Array
echo "Second value: ${FRUITS[1]}" 
echo "Third value: ${FRUITS[2]}"

echo "All value's: ${FRUITS[@]}" # @ --> is used to choose all the valus of the array.