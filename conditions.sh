#!/bin/bash

if [ -f "./error.txt" ]; then 
    echo "Error file exists"
else 
    echo "File doesn't exist Zaki"
fi

read -p " Who are you? do you know zaki" name
read -p "$name please share your grade " grade

if [ "$grade" = "A" ]; then 
    echo "You might have scored between 90-100"
elif [ "$grade" = "B" ]; then 
    echo "You might have scored between 80-89"
elif [ "$grade" = "C" ]; then 
    echo "You might have scored between 70-79"
elif [ "$grade" = "D" ]; then 
        echo "You might have scored between 60-69"
elif [ "$grade" = "F" ]; then 
    echo "You might have failed "
else 
    echo "Invalid grade provided"
fi

read -p " please provide the first number " first_num
read -p " please provide the second number " second_num

# Numeric comparision
if [ $first_num -eq $second_num ]; then echo "Equal"; fi
if [ $first_num -ne $second_num ]; then echo "Not Equal"; fi
if [ $first_num -lt $second_num ]; then echo "$first_num is less than $second_num"; fi
if [ $first_num -le $second_num ]; then echo "$first_num is less than or equal to $second_num"; fi
if [ $first_num -gt $second_num ]; then echo "$first_num is greater than $second_num"; fi
if [ $first_num -ge $second_num ]; then echo "$first_num is greater than or equal to $second_num"; fi

read -p "Provide the first string " first_string
read -p "Provide the second string " second_string

if [ "$first_string" = "$second_string" ]; then echo "Strings are equal"; fi
if [ "$first_string" != "$second_string" ]; then echo "Strings are not equal"; fi
if [ -z "$first_string" ]; then echo "First Strings is empty"; fi
if [ -n "$first_string" ]; then echo "First Strings is not empty"; fi

# File check condition

file="./hello_world.sh"
if [ -e "$file" ]; then echo "File exists"; fi
if [ -f "$file" ]; then echo "Regular File exists"; fi
if [ -r "$file" ]; then echo "Readable "; fi
if [ -w "$file" ]; then echo "Writable "; fi
if [ -x "$file" ]; then echo "Executable"; fi


