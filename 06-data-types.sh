#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$($NUMBER1+$NUMBER2)

echo "Total:: $SUM"

echo "How maney args passed : $#"
echo "All args passed : $@"
echo "Sceipt name : $0"