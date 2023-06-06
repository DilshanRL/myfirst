#!/bin/bash

cp /home/dilshan/Desktop/ngw/logs/* /home/dilshan/Desktop/finalcode3

output_file="combinedlog.txt"
log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0")

>"$output_file"


for file in "${log_files[@]}"; do 
    cat "$file" >>"$output_file"
done

awk -F " " '{print $1" "$2" "$3"\t"$9" "$10" "$11" "$12" "$13" "$14" "$15}' combinedlog.txt >test1





while IFS= read -r line; do
    date=$(echo "$line" | awk '{print $1, $2, $3}')
    
    day=$(date -d "$date" +%d)

    filename="${day}.txt"

    echo "$line" >> /home/dilshan/Desktop/finalcode3/dates/"$filename"

done < test1

