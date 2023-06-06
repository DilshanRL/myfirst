#!/bin/bash

log_dir="/home/dilshan/Desktop/ngw/logs"
output_dir="/home/dilshan/Desktop/finalcode3"
dates_dir="$output_dir/dates"

# Create the output directories if they don't exist
mkdir -p "$output_dir"
mkdir -p "$dates_dir"

# Combine log files into a single file
cat "$log_dir"/NgwStats.* > "$output_dir/combinedlog.txt"

# Process the combined log file
awk -F " " '{print $1, $2, $3, $9, $10, $11, $12, $13, $14, $15}' "$output_dir/combinedlog.txt" |
while read -r date time rest; do
    day=$(date -d "$date" +%d)
    filename="${day}.txt"
    echo "$date $time $rest" >> "$dates_dir/$filename"
done
