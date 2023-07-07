#!/bin/bash
mkdir /opt/aepona/ngw/gwuser/grp
mkdir /opt/aepona/ngw/gwuser/data_para
mkdir /opt/aepona/ngw/gwuser/output1
mkdir /opt/aepona/ngw/gwuser/para
mkdir /opt/aepona/ngw/gwuser/hours
mkdir /opt/aepona/ngw/gwuser/new

rm /opt/aepona/ngw/gwuser/grp/*
rm /opt/aepona/ngw/gwuser/data_para/*
rm /opt/aepona/ngw/gwuser/output1/*


# Define the color
yellow='\033[0;33m'
green='\033[0;32m'
red='\033[0;31m'
blue='\033[0;34m'
lblue='\033[1;34m'
reset='\033[0m'


log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0" "NgwStats")


count=( "sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp" )


count3=("Mm7SubmitReq" "Mm7SubmitRes" "Mm7DeliverReq" "Mm7DeliverReportReq" "Mm7ReadReplyReq" "sendMms" "sendMmsError" "notifyMmsReceptionFailure" "sendMmsResponseFailure" "notifyMmsDeliveryReceiptFailure" "notifyMmsReception" "sendMmsResponse" "notifyMmsDeliveryReceipt" )

file_type=( "9000" "9001" "9002" "9003" "1500" )


cp /opt/aepona/ngw/logs/NgwStats* /opt/aepona/ngw/gwuser/new/

cd /opt/aepona/ngw/gwuser/new/ || exit


for file1 in *; 
    do
        
        sed -i '1d' /opt/aepona/ngw/gwuser/new/"$file1"
        
        awk -F " " '{print $1" "$2" "$3"\t"$7" "$9" "$10" "$11" "$12" "$13" "$14" "$15}' /opt/aepona/ngw/gwuser/new/"$file1" >test1
        
        awk -F'[: ]' '{ date=$1"_"$2; sub(/:/, "", date); file=sprintf("%s/%s", "/opt/aepona/ngw/gwuser/output1", 'date'); print >> file }' "test1"


done



cd /opt/aepona/ngw/gwuser/output1 || exit



declare -a DATE

for file2 in *;
do

    DATE=(${DATE[@]} "$file2")

done

num1="${#DATE[@]}"



fun_1() {
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
                    awk 'NF > 1' /opt/aepona/ngw/gwuser/data_para/data"${count[num]}".txt > /opt/aepona/ngw/gwuser/para/para"${count[num]}".txt



                    #print the parameter and the date
                    echo -e "${green}${DATE[D1]}""$date1 ${count[num]}${reset}"


                    # Read the data from the file
                    data_file=/opt/aepona/ngw/gwuser/para/para"${count[num]}".txt
                    data=$(cat "$data_file")

                    # Iterate over each line of the data
                    while IFS= read -r line; do
                        time=$(echo "$line" | awk '{print $1}')
                        value=$(echo "$line" | awk '{print $2}')



                        stars=$(( value / 100 ))

                        # Print the time and asterisks
                        echo -e -n "${green}$time: ${reset}"
                        for ((i=1; i<=stars; i++)); do
                            echo -e -n "${yellow}▀${reset}"
                        done

                        # Print the value
                        echo " ($value)"
                    done <<< "$data"

                    #make a space
                    echo "   "

                done
}

fun_2() {

            for num in "${count1[@]}"; do
            
             # Process each keyword and calculate the sum for each hour
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
            grep "${count3[num]}" /opt/aepona/ngw/gwuser/hours/hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>/opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt
    
    

            #create a data_file
            awk 'NF > 1' /opt/aepona/ngw/gwuser/data_para/data"${count3[num]}".txt > /opt/aepona/ngw/gwuser/para/para"${count3[num]}".txt



            #print the parameter and the date
            echo -e "${green}${DATE[D1]}""$date1 ${count3[num]} ${reset}"


            # Read the data from the file
            data_file=/opt/aepona/ngw/gwuser/para/para"${count3[num]}".txt
            data=$(cat "$data_file")

            # Iterate over each line of the data
            while IFS= read -r line; do
                time=$(echo "$line" | awk '{print $1}')
                value=$(echo "$line" | awk '{print $2}')



                    stars=$(( value / 1 ))

                    # Print the time and asterisks
                    echo -e -n "${yellow}$time: ${reset}"
                    for ((i=1; i<=stars; i++)); do
                echo -e -n "${green}▀${reset}"
                done

                # Print the value
                echo " ($value)"
            done <<< "$data"



            #make a space
            echo "   "


        done 

}

fun_4() (
    grep "${file_type[count2]}" "${DATE[D1]}" > /opt/aepona/ngw/gwuser/grp/srv1

    
    

                    #awk 'substr($3,1,2) == "17" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >test1
                awk 'substr($3,1,2) == "00" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour1
                awk 'substr($3,1,2) == "01" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour2
                awk 'substr($3,1,2) == "02" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour3
                awk 'substr($3,1,2) == "03" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour4
                awk 'substr($3,1,2) == "04" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour5
                awk 'substr($3,1,2) == "05" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour6
                awk 'substr($3,1,2) == "06" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour7
                awk 'substr($3,1,2) == "07" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour8
                awk 'substr($3,1,2) == "08" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour9
                awk 'substr($3,1,2) == "09" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour10
                awk 'substr($3,1,2) == "10" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour11
                awk 'substr($3,1,2) == "11" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour12
                awk 'substr($3,1,2) == "12" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour13
                awk 'substr($3,1,2) == "13" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour14
                awk 'substr($3,1,2) == "14" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour15
                awk 'substr($3,1,2) == "15" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour16
                awk 'substr($3,1,2) == "16" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour17
                awk 'substr($3,1,2) == "17" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour18
                awk 'substr($3,1,2) == "18" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour19
                awk 'substr($3,1,2) == "19" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour20
                awk 'substr($3,1,2) == "20" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour21
                awk 'substr($3,1,2) == "21" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour22
                awk 'substr($3,1,2) == "22" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour23
                awk 'substr($3,1,2) == "23" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour24

               # sed -i '$ d' "/opt/aepona/ngw/gwuser/hours/hour${hour}"
   


        while true
        do 

        
             i=0
         for item in "${count[@]}"
            do
          echo -e "${yellow}$i.${reset} ${green}$item${reset}"
          i=$((i+1))
         done

          echo -e "${yellow}24.${reset} Go back"
          echo -e "${yellow}25.${reset} Exit"


            # Get numbers from the list and put into a array
            echo -e "${yellow}Enter the Number(0-23) of parameter(s) that you want(Eg: 0 1 3) : ${reset} \c"
            read -a count1


            if [[ $count1 -eq 25 ]]; then
               break 4
            fi



            case $count1 in

                0)
                    fun_1 ;;
                1)
                    fun_1 ;;
                2)
                    fun_1 ;;
                3)
                    fun_1 ;;
                4)
                    fun_1 ;;
                5)
                    fun_1 ;;
                6)
                    fun_1 ;;
                7)
                    fun_1 ;;
                8)
                    fun_1 ;;
                9)
                    fun_1 ;;
                10)
                    fun_1 ;;
                11)
                    fun_1 ;;
                12)
                    fun_1 ;;
                13)
                    fun_1 ;;
                14)
                    fun_1 ;;
                15)
                    fun_1 ;;
                16)
                    fun_1 ;;
                17)
                    fun_1 ;;
                18)
                    fun_1 ;;
                19)
                    fun_1 ;;
                20)
                    fun_1 ;;
                21)
                    fun_1 ;;
                22)
                    fun_1 ;;
                23)
                    fun_1 ;;
                24)
                    echo "Going back to previous menu"
                    break ;;
               

                *)
                    echo "Invalid number...Please enter number (0-23)" ;;

            esac

        


        done








    
)

fun_5() {
    grep "${file_type[count2]}" "${DATE[D1]}" > /opt/aepona/ngw/gwuser/grp/srv1

    
    



        #cd /opt/aepona/ngw/gwuser/hours/ || exit

                # Split each file into hourly segments and remove the last line
                awk 'substr($3,1,2) == "00" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour1
                awk 'substr($3,1,2) == "01" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour2
                awk 'substr($3,1,2) == "02" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour3
                awk 'substr($3,1,2) == "03" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour4
                awk 'substr($3,1,2) == "04" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour5
                awk 'substr($3,1,2) == "05" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour6
                awk 'substr($3,1,2) == "06" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour7
                awk 'substr($3,1,2) == "07" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour8
                awk 'substr($3,1,2) == "08" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour9
                awk 'substr($3,1,2) == "09" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour10
                awk 'substr($3,1,2) == "10" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour11
                awk 'substr($3,1,2) == "11" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour12
                awk 'substr($3,1,2) == "12" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour13
                awk 'substr($3,1,2) == "13" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour14
                awk 'substr($3,1,2) == "14" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour15
                awk 'substr($3,1,2) == "15" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour16
                awk 'substr($3,1,2) == "16" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour17
                awk 'substr($3,1,2) == "17" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour18
                awk 'substr($3,1,2) == "18" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour19
                awk 'substr($3,1,2) == "19" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour20
                awk 'substr($3,1,2) == "20" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour21
                awk 'substr($3,1,2) == "21" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour22
                awk 'substr($3,1,2) == "22" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour23
                awk 'substr($3,1,2) == "23" {print}' /opt/aepona/ngw/gwuser/grp/srv1 >/opt/aepona/ngw/gwuser/hours/hour24

        

        while true
        do 

        
             i=0
         for item in "${count3[@]}"
            do
          echo -e "${yellow}$i.${reset} ${green}$item${reset}"
          i=$((i+1))
         done

        
            echo -e "${yellow}13.${reset} Go back"


            # Get numbers from the list and put into a array
            echo -e "${yellow}Enter the Number(0-12) of parameter(s) that you want(Eg: 0 1 3) or press q to Exit : ${reset} \c"
            read -a count1


            
            if [[ $count1 = q ]]
                then exit
            fi

            


            case $count1 in

                0)
                    fun_2 ;;
                1)
                    fun_2 ;;
                2)
                    fun_2 ;;
                3)
                    fun_2 ;;
                4)
                    fun_2 ;;
                5)
                    fun_2 ;;
                6)
                    fun_2 ;;
                7)
                    fun_2 ;;
                8)
                    fun_2 ;;
                9)
                    fun_2 ;;
                10)
                    fun_2 ;;
                11)
                    fun_2 ;;
                12)
                    fun_2 ;;
                13)
                    echo "Going back to previous menu"
                    break ;;

                *)
                    echo "Invalid number...Please enter number (0-12)" ;;

            esac

        


        done

}

fun_6(){
    while true 
    do 

        echo -e "${green}0 - smpp0 ${reset}"
        echo -e "${green}1 - smpp1 ${reset}"
        echo -e "${green}2 - smpp2 ${reset}"
        echo -e "${green}3 - smpp3 ${reset}"
        echo -e "${green}4 - Mm7 ${reset}"
        echo -e "5 - Go Back"
        echo -e "6 - Exit"

        echo -e "${yellow}Enter the Number of service that you want : ${reset} \c"
        read -a count2


        case $count2 in
            0)
                fun_4 
                    ;;
            1)
                fun_4 
                    ;;
            2)
                fun_4 
                    ;;
            3)
                fun_4 
                    ;;
            4)
                fun_5 
                    ;;

            5) 
                break ;;
            6) 
                exit ;;
            *)
                echo "Invalid Number... Please try again"
                    ;;



        esac

        


    done
}





while true
    do 

        
        #echo "$num1"
        echo "*** Date Option ***"

        for ((i = 0; i < "$num1"; i++)); do
        
            X="${DATE[i]}"

            echo -e "${green} "$i"".""$X" ${reset}"
        done


        echo -e "${yellow}Enter the Number of Date that you want(Eg: 0 1 3) or Press q to Quit : ${reset} \c"
        read -a D1
        
            if [[ $D1 = q ]]
                then 
                echo "Exiting..."
                exit

            fi

            if [[ $D1 < $num1 ]]
                then 
                echo "*** Service Option ***"
                fun_6

            fi

            if [[ $D1 > $num1 ]]
                then
                echo "Invalid number... Please enter correctly..."

            fi

done




rm -rf /opt/aepona/ngw/gwuser/grp
rm -rf /opt/aepona/ngw/gwuser/data_para
rm -rf /opt/aepona/ngw/gwuser/output1
rm -rf /opt/aepona/ngw/gwuser/para
rm -rf /opt/aepona/ngw/gwuser/hours
rm -rf /opt/aepona/ngw/gwuser/new