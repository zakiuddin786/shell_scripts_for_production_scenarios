# Builtin variables of AWK
# $0 -> Print the entire current line
# $1, $2,..... -> Fields in the current line
# NR -> Current line number
# FS -> Field separator (default will be a white space)
# OFS -> Output field separator
# RS -> Record separator
# ORS -> Output record separator

#!/bin/bash
# print entire file
awk '{print $0}' cat_operations.sh

# print specfic column
awk '{print $2}' grades.txt

#print specific column based on field separator
awk -F "," '{print $2}' employees.txt

# print lines matching a pattern
awk '/POST/ {print $1, $3}' access.log

# Add two columns
awk -F',' '{sum = $1 - $4; print $2, sum}' employees.txt

# Custom Output separator
awk -F',' 'BEGIN {OFS="\t"} {sum = $1 - $4; print $2, sum}' employees.txt

# Count occurrences of IP Addressess
awk '{ip[$1]++} END {for (i in ip) print i, ip[i]}' access.log 

# find the process consuming high memory
ps -aux | awk 'BEGIN {OFS="\t"} $4 > 0.4 {print $0}'

# Find the processes running as a specfic user
ps -aux | awk '$1 == "ec2-user" {print $0}'

# summarize disk usage (NR is used for current line and we are skipping 
# printing of the header over here)
df -h | awk 'NR>1 {print $1, $5}'

# monitor high cpu usage in real time
top -b -n 1 | awk 'NR>7 {if ($9 > 0.0) print $0}'

# summarize user login activities
last | awk '{print $1}' | sort  | uniq -c

# find average response time from access logs
awk -F"1.1" '{print $2}' access.log | awk -F" " '{print $3}'