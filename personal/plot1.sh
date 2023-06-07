#!/bin/bash

# Read the data from the file
data_file="data.txt"
data=$(cat "$data_file")

# Iterate over each line of the data
while IFS= read -r line; do
  time=$(echo "$line" | awk '{print $1}')
  value=$(echo "$line" | awk '{print $2}')

  # Print the time and asterisks
  echo -n "$time: "
  for ((i=1; i<=value; i++)); do
    echo -n "*"
  done

  # Print the value
  echo " ($value)"
done <<< "$data"
