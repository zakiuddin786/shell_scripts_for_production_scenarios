#!/bin/bash
set -eom pipefail # Fail fast on errors
# this is a utility to run a command within the given timeout and kill if it exceeds the time
LOG_FILE="./all-logs.log"
log() {
    local level=$1 
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $level : $message" | tee -a "$LOG_FILE"
}

interrupt_handler() {
    log warning "The program got interrupted in between, please check what happened"
    log info "Killing the child processess"

    kill -- -$$ 2>/dev/null
    exit 130
}

trap interrupt_handler SIGINT

run_command_with_timeout() {
    local timeout=$1
    # Get the remaining arguments passed (assuming the command is having more arguments)
    local command="${@:2}"

    eval "$command" &
    local pid=$!

    echo "PID of $command is $pid"

    # wait for command with timeout
    local count=0
    while [[ $count -lt $timeout ]]; do
        if ! kill -0 $pid 2>/dev/null; then
            wait $pid 
            return $?
        fi
        sleep 1
        ((count++))
    done

    #timeout is reached, kill the process and the children
    echo "Command timed out after ${timeout}s" >&2
    #  kill child process first
    pkill -P $pid 2>/dev/null
    # kill the main process
    kill -9 $pid 2>/dev/null
    wait $pid 2>/dev/null 
    return 124 
}

if run_command_with_timeout 5 "sleep 4"; then
    echo "Command completed within timeout"
else
    echo "Command failed or timed out"
fi

# return the data from function
get_full_name() {
    local first_name=$1
    local last_name=$2
    echo "$first_name $last_name"
}

full_name=$(get_full_name "Mohammed Zakiuddin")
echo "Full name is: $full_name"

# writing recursive function

set -x 
#enable the tracing
factorial() {
    local num=$1 

    if [[ $num -lt 0 ]]; then
        echo "Error: factorial undefined for negarive numbers" >&2
        return 1
    elif [[ $num -eq 0 || $num -eq 1 ]]; then
        echo 1
        return 0
    else 
        local prev=$(factorial $((num-1)))
        echo $((num * prev))
    fi
}
# disable the tracing

# TODO: Run this factorial function using the run_command_with_timeout utility
echo "Factorial of 5 is : $(factorial 5)"
set +x 


# TODO: Write a recursive directory traversal function

# utility function to print the logs with timestamp and save in a file


log info "hello zaki"