#!/bin/bash

# Create directories
mkdir data_para hours para logs output_dir para

# Define log files
log_files=("appleStats.9" "appleStats.8" "appleStats.7" "appleStats.6" "appleStats.5" "appleStats.4" "appleStats.3" "appleStats.2" "appleStats.1" "appleStats.0")

# Combine log files into a single file
cat /opt/apple/logs/{${log_files[*]}} >> /opt/apple/gwuser/logs/combined_log

# Extract specific columns from the combined log and save it as 'test1'
awk -F " " '{print $1" "$2" "$3"\t"$9" "$10" "$11" "$12" "$13" "$14" "$15}' /opt/apple/gwuser/logs/combined_log > test1

# Split 'test1' file into multiple files based on date and time
awk -F'[: ]' '{ date=$1" "$2; sub(/:/, "", date); file=sprintf("%s/log_%s.log", "'output_dir'", date); print >> file }' "/opt/banana/apple/gwuser/test1"

# Define keywords to search for in log files
count=("sendcarrot" "sendcarrotError" "notifycarrotReceptionFailure" "notifycarrotDeliveryReceiptFailure" "notifycarrotReception" "notifycarrotDeliveryReceipt" "sendcarrotResponse" "sendcarrotResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp")

# Process each output file
for file in /opt/banana/apple/gwuser/output_dir/*; do
    date1=$(awk 'NR==1 {print $1, $2; exit}' "$file")  # Extract date from the file

    # Split each file into hourly segments and remove the last line
    for ((i = 0; i < 24; i++)); do
        hour=$((i + 1))
        sed -n "/${i}:00:00/,/$((i + 1)):00:00/p" "$file" >"/opt/banana/apple/gwuser/hours/hour${hour}"
        sed -i '$ d' "/opt/banana/apple/gwuser/hours/hour${hour}"
    done

    yellow='\033[0;33m'
    reset='\033[0m'
    echo -e "${yellow}****************************************************************** Date = $date1 *************************************************************************${reset}"

    # Process each keyword and calculate the sum for each hour
    for word in "${count[@]}"; do
        for ((hour = 0; hour < 24; hour++)); do
            grep "$word" "/opt/banana/apple/gwuser/hours/hour$((hour + 1))" | awk -F"=" '{sum += $2} END {printf "%02d:00-%02d:00   %s\n", hour, hour+1, sum}' >/opt/banana/apple/gwuser/
