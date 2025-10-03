#!/bin/bash

# Basic input
echo "Enter your name"
read name
echo "Hello, $name"

# input with prompt

read -p "Hi $name Enter your occupation " occupation
echo "Good to know you are $occupation"

# silent input for reading passwords"
read -s -p "Hi $name do you want to share any secret with me ?" secret
echo "I will not share your $secret with anyone"

# inout with timeout
if read -t 10 -p "Are you okay with the deal ? You have to respond in 10 seconds: " choice; then
    echo "You chose $choice"
else 
    echo "Timeout, please respond in the given time "
fi