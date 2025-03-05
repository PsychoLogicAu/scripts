#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <command to run> [arguments...]"
    exit 1
fi

command_to_run="$1"
shift 1  # Remove the first argument

while true; do
    $command_to_run "$@"
    exit_status=$?
    
    if [ $exit_status -ne 0 ]; then
        echo "Command exited with status: $exit_status"
        exit $exit_status
    else
        echo "Command executed successfully."
    fi
done
