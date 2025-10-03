#!/bin/bash

# declare associative array
declare -A server_information

server_information["web_server"]="13.232.52.243"
server_information["db_server"]="13.232.52.263"
server_information["backend_server"]="13.238.52.243"

# access values
echo "Web server IP: ${server_information["web_server"]}"
