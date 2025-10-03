#!/bin/bash

read -p "Enter one of operation you would like from (+, -, *, /) : " operation

case $operation in
    "+") 
        echo "Addition Selected"
        ;;
    "-") 
        echo "Subtraction Selected"
        ;;
    "*") 
        echo "Multiplication Selected"
        ;;
    "/") 
        echo "Division Selected"
        ;;     
    *) 
        echo "Invalid Operation"
        exit 1
        ;;   
esac