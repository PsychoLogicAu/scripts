#!/bin/bash

# Check for the correct number of arguments
if [ $# -lt 3 ]; then
    echo "Usage: $0 <number_of_runs> <executable_path> <arguments...>"
    exit 1
fi

# Extract arguments
number_of_runs=$1
executable_path=$2
shift 2 # Shift to remove the first two arguments

# Run the sub-command for the specified number of times
for ((i=1; i<=number_of_runs; i++)); do
    output_file="output_$i.txt"
    timestamp=$(date +%Y-%m-%d %H:%M:%S)
    echo "${timestamp} - Running iteration $i..."
    $executable_path "$@" > "$output_file" 2>&1
    timestamp=$(date +%Y-%m-%d %H:%M:%S)
    echo "${timestamp} - Iteration $i completed. Output saved to $output_file"

    # Output the last 10 lines of the output file
    echo "Last 10 lines of output:"
    tail -n 10 "$output_file"
done

