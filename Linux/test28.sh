#!/bin/bash



count=( "sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp" )


for file in /home/dilshan/Desktop/finalcode3/dates/*; do


date=$(awk 'NR==1 {print $1, $2; exit}' $file)



sed -n "/00:00:00/,/01:00:00/p" "$file" >hour1
sed -n "/01:00:00/,/02:00:00/p" "$file" >hour2
sed -n "/02:00:00/,/03:00:00/p" "$file" >hour3
sed -n "/03:00:00/,/04:00:00/p" "$file" >hour4
sed -n "/04:00:00/,/05:00:00/p" "$file" >hour5 
sed -n "/05:00:00/,/06:00:00/p" "$file" >hour6
sed -n "/06:00:00/,/07:00:00/p" "$file" >hour7
sed -n "/07:00:00/,/08:00:00/p" "$file" >hour8
sed -n "/08:00:00/,/09:00:00/p" "$file" >hour9
sed -n "/09:00:00/,/10:00:00/p" "$file" >hour10
sed -n "/10:00:00/,/11:00:00/p" "$file" >hour11
sed -n "/11:00:00/,/12:00:00/p" "$file" >hour12
sed -n "/12:00:00/,/13:00:00/p" "$file" >hour13
sed -n "/13:00:00/,/14:00:00/p" "$file" >hour14
sed -n "/14:00:00/,/15:00:00/p" "$file" >hour15
sed -n "/15:00:00/,/16:00:00/p" "$file" >hour16
sed -n "/16:00:00/,/17:00:00/p" "$file" >hour17
sed -n "/17:00:00/,/18:00:00/p" "$file" >hour18
sed -n "/18:00:00/,/19:00:00/p" "$file" >hour19
sed -n "/19:00:00/,/20:00:00/p" "$file" >hour20
sed -n "/20:00:00/,/21:00:00/p" "$file" >hour21
sed -n "/21:00:00/,/22:00:00/p" "$file" >hour22
sed -n "/22:00:00/,/23:00:00/p" "$file" >hour23
sed -n "/23:00:00/,/00:00:00/p" "$file" >hour24




sed -i '$ d' hour1
sed -i '$ d' hour2
sed -i '$ d' hour3
sed -i '$ d' hour4
sed -i '$ d' hour5
sed -i '$ d' hour6
sed -i '$ d' hour7
sed -i '$ d' hour8
sed -i '$ d' hour9
sed -i '$ d' hour10
sed -i '$ d' hour11
sed -i '$ d' hour12
sed -i '$ d' hour13
sed -i '$ d' hour14
sed -i '$ d' hour15
sed -i '$ d' hour16
sed -i '$ d' hour17
sed -i '$ d' hour18
sed -i '$ d' hour19
sed -i '$ d' hour20
sed -i '$ d' hour21
sed -i '$ d' hour22
sed -i '$ d' hour23
sed -i '$ d' hour24


yellow='\033[0;33m'
    reset='\033[0m'
    echo -e "${yellow}//////////////////////////////////////////////////// Date = $date ////////////////////////////////////////////////////////////${reset}"

#echo "///////////////////////////////// Date = $file /////////////////////////////////////////"


for word in "${count[@]}"; do


    grep "$word" hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >data"$word".txt
    grep "$word" hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>data"$word".txt
    grep "$word" hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>data"$word".txt
    grep "$word" hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>data"$word".txt
    grep "$word" hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>data"$word".txt
    grep "$word" hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>data"$word".txt
    grep "$word" hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>data"$word".txt
    grep "$word" hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>data"$word".txt
    grep "$word" hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>data"$word".txt
    grep "$word" hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>data"$word".txt
    grep "$word" hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>data"$word".txt
    grep "$word" hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>data"$word".txt
    grep "$word" hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>data"$word".txt
    grep "$word" hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>data"$word".txt
    grep "$word" hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>data"$word".txt
    grep "$word" hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>data"$word".txt
    grep "$word" hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>data"$word".txt
    grep "$word" hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>data"$word".txt
    grep "$word" hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>data"$word".txt
    grep "$word" hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>data"$word".txt
    grep "$word" hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>data"$word".txt
    grep "$word" hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>data"$word".txt
    grep "$word" hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>data"$word".txt
    grep "$word" hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>data"$word".txt



    awk 'NF > 1' data"$word".txt >"$word".txt



    
    echo "$date $word"

    termgraph < "$word".txt
    

done



done
