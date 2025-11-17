#!/bin/bash

set -euo pipefail
# e -> Fail fast on any command failure
# u -> for catching typos and undefined variables
# -o pipefail to prevent pipeline failures
# -m makes the script run in its own process group

# DB migration scipt
# Imagine the scripts are written to perform all these below activities
# 1. Migration of the database (suppose this script fails)
# 2. Update of the schema
# 3. notify the team
# migrate_db.sh
# update_schema.sh
# notify_team.sh

DB_HOST="zaki-db.zaki.com"
DB_PORT=1234
TIMEOUT=30

interrupt_handler() {
    log warning "The program got interrupted in between, please check what happened"
    log info "Killing the child processess"

    kill -- -$$ 2>/dev/null
    exit 130
}

trap 'interrupt_handler' SIGINT SIGHUP EXIT #better to make use of single quotes whenever the command is written

connect_database() {
    echo "connecting to $DB_HOST"
    echo "Connection successful"
}

connect_database
grep a ./grades.txt | sort | uniq > students.txt
echo "Fetched the grades of all the students successfully"
trap -l # list all the available signals

Layout for script
#!/bin/bash
set options

1. Define variables
2. Define functions
3. Define the trap handler functions
4. Install the trap commands 
5. Main program should be started