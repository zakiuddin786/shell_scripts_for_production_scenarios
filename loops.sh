#!/bin/bash

# Basic for loop with range
echo "Counting the numbers from 1 to 10:"
for i in {1..10}; do
    echo "Number : $i"
done

# For loop used on array
languages=("shell_script" "python programming" "java")
echo "Checking all the languages"

for lang in "${languages[@]}"; do 
    echo " language : $lang"
done

# for loop with files
echo "Files in current directory"
for file in *.sh; do
    if [ -f "$file" ]; then
        echo "Found: $file"
    fi
done

counter=1
echo "While loop will be counting till 10: "
while [ $counter -le 10 ]; do
    echo "Counter: $counter"
    ((counter++))
done

# while loop reading file 
# IFS = internal field separator if not used then the white spacing in each line will not be preserved
while IFS= read -r line; do
    echo "Line: $line"

done < "./switch_case.sh"

# Infinite loop with break statement
while true; do 
    read -p "Enter quit to exit: " input
    if [ "$input" = "quit" ]; then 
    break;
    fi 
    echo "You entered: $input"
done