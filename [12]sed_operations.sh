# Basic concepts of SED:

# 1. Pattern Space: 
# -> Temporary buffer where SED perform operation
# -> Each line from inpur gets loaded into pattern space
# -> After processing the pattern space is printed to stdout

# 2. Hold Buffer: 
# -> Additional buffer for temporary storage
# -> -----
#     operation: xyz
#     client: abc
#     ip: xysdcs
#     latency: 800 ms
#     -------
#     operation: xyz
#     client: abc
#     ip: xysdcs
#     latency: 100 ms
#     -------
# -> complex pattern matching
# -> multi line operations being performed
# -> editing commands: search, replace, delete, insert, transform etc  

# Syntax:
# sed [Options] 'Command1; Command2;....' [inputfiles]

# Options:
# -E for regex
# -i in place edit, -i.bak backup
# -e add script
# -n suppress default printing

# Commands:
# s: substitution
# d: delete
# p: print
# a: Append
# i: Insert
# c: change

#!/bin/bash

# print specific line 
sed -n '2p' users.txt

# Delete a specific line while printing
sed '3d' users.txt

# Delete a specific line range while printing
sed '1,3d' users.txt

echo "Replacing"
# search and replace
sed 's/developer/Development engineer/' users.txt

# search and perform inplace replacement with backup
sed -i.bak 's/developer/Development engineer/' users.txt

# search and perform inplace replacement
sed -i 's/developer/Development engineer/' users.txt

# making the changes in the configuration file
sed -i.bak -e 's/database_name=production_db/database_name=development_db/' \
-e 's/log_level=INFO/log_level=DEBUG/' system.conf

# insert a comment before line 9
sed -i '9i # This is the configuration for logging'  system.conf

# Append a comment before line 15
sed -i '15a # This is the end for logging configuration'  system.conf

# Given service logs containing details on the operation, client name, and the 
# time taken for the request processsing identify the total number of client names
# for which the time taken is greater than 400ms for a given operation (Ex: FetchUserDetails)

cat service_logs.log \
| sed '/^---/ !{H;$ !d};x;/Operation=UpdateInventory/ !d' \
| sed -E '/^---/ !{H;$ !d};x;/Time=([0-9]{9,}|[6-9][0-9]{2}) ms/ !d' \
| grep "Client" \
| sort \
| uniq -c
