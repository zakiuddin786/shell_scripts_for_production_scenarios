#!/bin/bash

# direct assignment of values
computer_parts[0]="keyboard"
computer_parts[1]="mouse"
computer_parts[2]="motherboard"
computer_parts[3]="monitor"

# Access the values
echo "First computer part is: ${computer_parts[0]}"
echo "Second computer part is: ${computer_parts[1]}"
echo "All the computer part are: ${computer_parts[@]}"
echo "Number of computer part are: ${#computer_parts[@]}"

# Assign with paranteheses notation
web_dev_utilities=("javascript" "REACT" "Angular" "HTML" CSS )
echo "All the web dev utilities are: ${web_dev_utilities[@]}"
echo "count of the web dev utilities is: ${#web_dev_utilities[@]}"


#  explicit declaration
declare -a shell_concepts=("arrays" "functions" "conditions" "loops")
echo "All the shell concepts are: ${shell_concepts[@]}"
echo "count of the shell concepts is: ${#shell_concepts[@]}"

# Iterating over the arrays

for part in "${computer_parts[@]}"; do
    echo "$part is a computer part"
done

# Add elements to the array
servers=("syncques.com" "google.com" "linkedin.com")
servers+=("facebook.com")
servers+=("instagram.com")

# insert at a specific postion by replacement and slicing
# slicing of array ${array[@]:start:end}
servers=("${servers[@]:0:1}" "youtube.com" "${servers[@]:1}")

# delete the element from array
unset servers[2]
unset servers[1]

# Iterate over the values in array
for server in "${servers[@]}";do
    ping -c 1 "$server"
done

# iterate with indices
for server in "${!servers[@]}";do
    echo "Index: $server: ${servers[server]}"
done

# printing in C style loop
for((i=0; i<${#servers[@]}; i++)); do
    echo "Index: $i: ${servers[i]}"
done

# while loop way
i=0
while [[ $i -lt ${#servers[@]} ]]; do
    echo "server $i : ${servers[i]}"
    ((i++))
done

# Copying the array
backup_servers=("${servers[@]}")
echo "backup servers are ${backup_servers[@]}"

# reverse array using tac(bottom to top) which is inverse of cat (top to bottom)
reverse_servers=($(printf '%s\n' "${backup_servers[@]}" | tac ))
echo "reversed servers are ${reverse_servers[@]}"

# sort the array
sorted_servers=($(printf '%s\n' "${backup_servers[@]}" | sort))
echo "sorted servers are ${sorted_servers[@]}"

# read text files into the array
log_files=($(find ./ -name "*.log" -type f))
echo "The text files in the current director are ${log_files[@]}"

# analysing the log files TODO: see if we can combine with grep, awk or sed for 
# more powerful analysis
for log_file in "${log_files[@]}"; do
if [[ -r "$log_file" ]]; then
    line_count=$(wc -l < "$log_file")
    size=$(du -h "$log_file")
    echo "$log_file : has $line_count lines and has a size of $size"
else
    echo "$log_file permission denied"
fi
done
