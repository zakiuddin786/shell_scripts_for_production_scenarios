#!/bin/bash

set -euo pipefail

# Configurations
SOURCE_DIR="/Users/rabbit/Desktop/DevOps/shell_scripts_for_production_scenarios"
DEST_DIR="/Users/rabbit/Desktop/DevOps/backup_shell_Scripts"
LOG_FILE="$DEST_DIR/backup_logs.log"

# Trap functions 

on_error(){
    log error "Error occurred"
}

on_exit(){
    log info "Backup script completed"
}

# Trap Handlers
trap on_error ERR
trap on_exit EXIT

# Functions
log() {
    local level=$1 
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $level : $message" | tee -a "$LOG_FILE"
}

# main program

mkdir -p "$DEST_DIR"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
BACKUP_FILE="$DEST_DIR/scripts_backup_$TIMESTAMP.tar.gz"

log INFO Starting the backup

# tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" . >> "$LOG_FILE"  # backups all the files

find "$SOURCE_DIR" -type f -name "*.sh" -print0 | tar -czf "$BACKUP_FILE" --null -T - >> "$LOG_FILE"  # backups only the shell files
