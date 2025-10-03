#!/bin/bash 

# Declaring using function keyword
function greet() {
    echo "Hello, World"
}

# declare without using function keyword
ask_user() {
    echo "How are you?"
}

# Invoking the function
greet
ask_user

# function with parameters
greet_user() {
    local name=$1
    local occupation=$2

    echo "Hello $name good to know your $occupation"
}

# Calling function by passing parameters
greet_user zaki engineer

# Utility function to check if a file exists

check_file(){
    local filename=$1

    if [[ -f "$filename" ]]; then
        echo "File $filename exists"
        return 0
    else
        echo "File $filename doesnot exist" >&2
        return 1;
    fi
}

check_file employees.txt

# TODO: create functions for getting file information, file_size