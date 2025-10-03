#!/bin/bash

# Basic search
grep "zaki" conditions.sh

# Case insensitive search 
grep -i "zaki" conditions.sh

# Show line number
grep -i -n "zaki" conditions.sh

# Show the number of matches found
grep -i -c "zaki" conditions.sh

# Search on multiple files
grep -i  -n "zaki" *.sh

# Print the lines before and after the pattern match
grep -n -B 2 -A 2 "zaki" *

# invert match (show non matching lines)
grep -v -n "echo" *.sh

#  multi pattern search
grep -v -n -E "echo|read" *.sh

#  recursive search
grep -v -n -E "echo|read" ../*


