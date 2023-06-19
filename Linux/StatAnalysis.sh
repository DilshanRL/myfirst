#!/bin/bash

# Define the color
yellow='\033[0;33m'
        reset='\033[0m'

# Create directories
mkdir data_para hours para logs output_dir


# Define log files
log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0" "NgwStats")


# Combine log files into a single file
for file in "${log_files[@]}"; do
    cat /opt/aepona/ngw/logs/"$file" >> /opt/aepona/ngw/gwuser/logs/combined_log
done

# Avoid any uncompleted line
sed -i '1d' /opt/aepona/ngw/gwuser/logs/combined_log


# Extract specific columns from the combined log and save it as 'test1'
awk -F " " '{print $1" "$2" "$3"\t"$7" "$8" "$9" "$10" "$11" "$12" "$13" "$14" "$15}' /opt/aepona/ngw/gwuser/logs/combined_log >test1


# Split 'test1' file into multiple files based on date and time
awk -F'[: ]' '{ date=$1" "$2; sub(/:/, "", date); file=sprintf("%s/log_%s.log", "'output_dir'", date); print >> file }' "/opt/aepona/ngw/gwuser/test1"





# Define keywords to search for in log files
count=( "sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp" )


# Get user input
echo -e "${yellow}Do you want Full Summary(1) or Specific Stats(2) : "
echo -e "Please press (1/2) : ${reset}" 
read -r X



# Full Summary
if [ "$X" -eq 1 ]
    then 


    # Process each output file
    for file in /opt/aepona/ngw/gwuser/output_dir/*; do

    


        date1=$( awk 'NR==1 {print $1, $2; exit}' "$file" )   # Extract date from the file


        # Split each file into hourly segments and remove the last line
        for ((i = 10; i < 24; i++)); do
            hour=$((i + 1))
            sed -n "/00:00:00/,/01:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour1
            sed -n "/01:00:00/,/02:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour2
            sed -n "/02:00:00/,/03:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour3
            sed -n "/03:00:00/,/04:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour4
            sed -n "/04:00:00/,/05:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour5
            sed -n "/05:00:00/,/06:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour6
            sed -n "/06:00:00/,/07:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour7
            sed -n "/07:00:00/,/08:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour8
            sed -n "/08:00:00/,/09:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour9
            sed -n "/09:00:00/,/10:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour10
            sed -n "/${i}:00:00/,/$((i + 1)):00:00/p" "$file" >"/opt/aepona/ngw/gwuser/hours/hour${hour}"
            sed -i '$ d' "/opt/aepona/ngw/gwuser/hours/hour${hour}"
        done

        #print date in Yellow
        echo -e "${yellow}****************************************************************** Date = $date1 *************************************************************************${reset}"


   
        for word in "${count[@]}"; do

            # Process each keyword and calculate the sum for each hour
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
            grep "$word" /opt/aepona/ngw/gwuser/hours/hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"$word".txt
    
    

            #create a data_file
            awk 'NF > 1' /opt/aepona/ngw/gwuser/data_para/data"$word".txt > /opt/aepona/ngw/gwuser/para/"$word".txt



            #print the parameter and the date
            echo "$date1 $word"


            # Read the data from the file
            data_file=/opt/aepona/ngw/gwuser/para/"$word".txt
            data=$(cat "$data_file")

            # Iterate over each line of the data
            while IFS= read -r line; do
                time=$(echo "$line" | awk '{print $1}')
                value=$(echo "$line" | awk '{print $2}')



                    stars=$(( value / 1000 ))

                    # Print the time and asterisks
                    echo -n "$time: "
                    for ((i=1; i<=stars; i++)); do
                    echo -e -n "${yellow}▀${reset}"
                    done

                    # Print the value
                        echo " ($value)"
            done <<< "$data"



            #make a space
            echo "   "


   


        done



    done

fi


if [ "$X" -eq 2 ]
    then 


    # Iterate over the elements of the list
    i=0
    for item in "${count[@]}"
        do
        echo -e "${yellow}$i.${reset} $item"
        i=$((i+1))
    done


    # Get numbers from the list and put into a array
    echo -e "${yellow}Enter the Number(0-23) of parameter(s) that you want(Eg: 0 1 3) : ${reset}"
    read -a count1




    for file in /opt/aepona/ngw/gwuser/output_dir/*; do

    


        date1=$( awk 'NR==1 {print $1, $2; exit}' "$file" )   # Extract date from the file


        # Split each file into hourly segments and remove the last line
        for ((i = 10; i < 24; i++)); do
            hour=$((i + 1))
            sed -n "/00:00:00/,/01:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour1
            sed -n "/01:00:00/,/02:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour2
            sed -n "/02:00:00/,/03:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour3
            sed -n "/03:00:00/,/04:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour4
            sed -n "/04:00:00/,/05:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour5
            sed -n "/05:00:00/,/06:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour6
            sed -n "/06:00:00/,/07:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour7
            sed -n "/07:00:00/,/08:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour8
            sed -n "/08:00:00/,/09:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour9
            sed -n "/09:00:00/,/10:00:00/p" "$file" >/opt/aepona/ngw/gwuser/hours/hour10
            sed -n "/${i}:00:00/,/$((i + 1)):00:00/p" "$file" >"/opt/aepona/ngw/gwuser/hours/hour${hour}"
            sed -i '$ d' "/opt/aepona/ngw/gwuser/hours/hour${hour}"
        done


    
        echo -e "${yellow}****************************************************************** Date = $date1 *************************************************************************${reset}"





        for num in "${count1[@]}"; do
            
             # Process each keyword and calculate the sum for each hour
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
            grep "${count[num]}" /opt/aepona/ngw/gwuser/hours/hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt
    
    

            #create a data_file
            awk 'NF > 1' /opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt > /opt/aepona/ngw/gwuser/para/"${count[num]}".txt



            #print the parameter and the date
            echo "$date1 ${count[num]}"


            # Read the data from the file
            data_file=/opt/aepona/ngw/gwuser/para/"${count[num]}".txt
            data=$(cat "$data_file")

            # Iterate over each line of the data
            while IFS= read -r line; do
                time=$(echo "$line" | awk '{print $1}')
                value=$(echo "$line" | awk '{print $2}')



                    stars=$(( value / 1000 ))

                    # Print the time and asterisks
                    echo -n "$time: "
                    for ((i=1; i<=stars; i++)); do
                echo -e -n "${yellow}▀${reset}"
                done

                # Print the value
                echo " ($value)"
            done <<< "$data"



            #make a space
            echo "   "


        done
    

    done

fi



#finally remove all create file and folders
rm -rf test1 hours para data_para output_dir logs
