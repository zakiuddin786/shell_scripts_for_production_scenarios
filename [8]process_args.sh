#!/bin/bash

echo "Script name: $0"
echo "First Argument passed: $1"
echo "Second Argument passed: $2"
echo "Thrid Argument passed: $3"

echo " $@ These are the arugments passed "
echo "You passed $# number of arguments"

if [ $# -eq 0 ]; then
    echo "To use the $0 you need to pass arguments in this way <arg1> <arg2> ...."
    exit 1
fi 

echo "Processing the request"

# Output to the file 
for arg in $@; do
    echo "Processing The $arg" >> logfile.txt
done

