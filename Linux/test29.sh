#!/bin/bash

# Array of strings to count occurrences
count=("sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp")

# Loop through each file in the directory
for file in /home/dilshan/Desktop/finalcode3/dates/*; do
    # Extract the date from the first line of the file
    date=$(awk 'NR==1 {print $1, $2; exit}' "$file")

    # Loop through each hour of the day
    for ((hour=0; hour<24; hour++)); do
        # Define the start and end time for the current hour
        start_time=$(printf "%02d:00:00" "$hour")
        end_time=$(printf "%02d:00:00" "$((hour+1))")

        # Extract lines between start and end time and save to separate files
        sed -n "/$start_time/,/$end_time/p" "$file" > "hour$hour"
        # Remove the last line from each hour file
        sed -i '$ d' "hour$hour"
    done

    # Print the date separator
    echo "////////////////////////////////////////// Date = $date //////////////////////////////////////////"

    # Loop through each word in the count array
    for word in "${count[@]}"; do
        # Loop through each hour file and count occurrences of the word
        for ((hour=0; hour<24; hour++)); do
            # Count occurrences of the word in the current hour
            sum=$(grep -c "$word" "hour$hour")
            # Print the hour range and the count
            echo "$(printf "%02d:00-%02d:00" "$hour" "$((hour+1))")   $sum"
        done
        echo # Print an empty line for readability
    done
done

