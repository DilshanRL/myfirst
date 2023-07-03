#!/bin/bash

# Define the color
yellow='\033[0;33m'
red='\033[0;32m'
green='\033[0;31m'
blue='\033[0;34m'
reset='\033[0m'


log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0" "NgwStats")


count=( "sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp" )


count3=("Mm7SubmitReq" "Mm7SubmitRes" "Mm7DeliverReq" "Mm7DeliverReportReq" "Mm7ReadReplyReq" "sendMms" "sendMmsError" "notifyMmsReceptionFailure" "sendMmsResponseFailure" "notifyMmsDeliveryReceiptFailure" "notifyMmsReception" "sendMmsResponse" "notifyMmsDeliveryReceipt" )




for file1 in "${log_files[@]}"; 
    do
        
        sed -i '1d' /home/dilshan/Desktop/logs/"$file1"
        
        awk -F " " '{print $1" "$2" "$3"\t"$7" "$9" "$10" "$11" "$12" "$13" "$14" "$15}' /home/dilshan/Desktop/logs/"$file1" >test1
        
        awk -F'[: ]' '{ date=$1"_"$2; sub(/:/, "", date); file=sprintf("%s/%s", "output1", 'date'); print >> file }' "test1"


done




rm /home/dilshan/Desktop/newcode/test1

cd /home/dilshan/Desktop/newcode/output1/ || exit


declare -a DATE
    for file2 in *;
        do

            DATE=(${DATE[@]} "$file2")

done



num1="${#DATE[@]}"


for ((i = 0; i < "$num1"; i++)); do
        
        X="${DATE[i]}"

        echo -e "${blue} "$i"".""$X" ${reset}"


done




echo -e "${yellow}Enter the Number of Date that you want(Eg: 0 1 3) : ${reset}"
read -a D1


echo -e "${blue}0 - smpp0 ${reset}"
echo -e "${blue}1 - smpp1 ${reset}"
echo -e "${blue}2 - smpp2 ${reset}"
echo -e "${blue}3 - smpp3 ${reset}"
echo -e "${blue}4 - Mm7 ${reset}"
echo -e "${blue}5 - All ${reset}"


file_type=( "9000" "9001" "9002" "9003" "1500" )

echo -e "${yellow}Enter the Number of service that you want : ${reset}"
read -a count2


echo "${DATE[D1]}"


if [[ "$count2" -eq 0 || "$count2" -eq 1 || "$count2" -eq 2 || "$count2" -eq 3 ]]; then

    grep "${file_type[count2]}" "${DATE[D1]}" > /home/dilshan/Desktop/newcode/grp/srv1
    rm /home/dilshan/Desktop/newcode/output1/*

    # Split each file into hourly segments and remove the last line
    for ((i = 10; i < 24; i++)); 
        do
            hour=$((i + 1))
                sed -n "/00:00:00/,/01:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour1
                sed -n "/01:00:00/,/02:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour2
                sed -n "/02:00:00/,/03:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour3
                sed -n "/03:00:00/,/04:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour4
                sed -n "/04:00:00/,/05:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour5
                sed -n "/05:00:00/,/06:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour6
                sed -n "/06:00:00/,/07:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour7
                sed -n "/07:00:00/,/08:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour8
                sed -n "/08:00:00/,/09:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour9
                sed -n "/09:00:00/,/10:00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >/home/dilshan/Desktop/newcode/hours/hour10
                sed -n "/${i}:00:00/,/$((i + 1)):00:00/p" /home/dilshan/Desktop/newcode/grp/srv1 >"/home/dilshan/Desktop/newcode/hours/hour${hour}"
                sed -i '$ d' "/home/dilshan/Desktop/newcode/hours/hour${hour}"
    done

    echo "${file_type[count2]}"

    whille true; 
        do

        # Iterate over the elements of the list
        i=0
        for item in "${count[@]}"
            do
            echo -e "${yellow}$i.${reset} $item"
            i=$((i+1))
        done


        echo "24. Exit"
        # Get numbers from the list and put into a array
        echo -e "${yellow}Enter the Number(0-23) of parameter(s) that you want(Eg: 0 1 3) : ${reset}"
        read -a count1


        if (( count1 >=1 && count1 <=23 )); then

            for num in "${count1[@]}"; do

                # Process each keyword and calculate the sum for each hour
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
                grep "${count[num]}" /home/dilshan/Desktop/newcode/hours/hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>/home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt
    
    

                #create a data_file
                awk 'NF > 1' /home/dilshan/Desktop/newcode/data_para/data"${count[num]}".txt > /home/dilshan/Desktop/newcode/para/para"${count[num]}".txt



                #print the parameter and the date
                echo "${DATE[D1]}""$date1 ${count[num]}"


                # Read the data from the file
                data_file=/home/dilshan/Desktop/newcode/para/para"${count[num]}".txt
                data=$(cat "$data_file")

                # Iterate over each line of the data
                while IFS= read -r line; do
                    time=$(echo "$line" | awk '{print $1}')
                    value=$(echo "$line" | awk '{print $2}')



                    stars=$(( value / 10 ))

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

            read -n 1 -s -r -p "press any key to continue..."

        elif (( count1 == 24)); then
                 echo "Exiting..."
            break

        else 
                echo "Invalid choice. Please try again. "
                read -n 1 -s -r -p "Press any key to continue..."

        fi



    done




    rm /home/dilshan/Desktop/newcode/grp/*
    rm /home/dilshan/Desktop/newcode/data_para/*


fi








