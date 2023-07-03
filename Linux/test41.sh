#!/bin/bash


log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0")



for file in "${log_files[@]}"; do 
    cat /home/dilshan/Desktop/ngw/logs/"$file" >>/home/dilshan/Desktop/code4/logs/combined_log
done



#cat /home/dilshan/Desktop/ngw/logs/* > /home/dilshan/Desktop/code4/logs/combined_log


#sort -k1,1 -k2,2 -k3,3 -o "/home/dilshan/Desktop/code4/logs/sorted_log_file" "/home/dilshan/Desktop/code4/logs/combined_log"

awk -F " " '{print $1" "$2" "$3"\t"$9" "$10" "$11" "$12" "$13" "$14" "$15}' /home/dilshan/Desktop/code4/logs/combined_log >test1

awk -F'[: ]' '{ date=$1" "$2; sub(/:/, "", date); file=sprintf("%s/log_%s.log", "'output_dir'", date); print >> file }' "/home/dilshan/Desktop/code4/test1"



count=( "sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp" )


for file in /home/dilshan/Desktop/code4/output_dir/*; do


date1=$( awk 'NR==1 {print $1, $2; exit}' "$file" )



sed -n "/00:00:00/,/01:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour1
sed -n "/01:00:00/,/02:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour2
sed -n "/02:00:00/,/03:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour3
sed -n "/03:00:00/,/04:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour4
sed -n "/04:00:00/,/05:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour5 
sed -n "/05:00:00/,/06:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour6
sed -n "/06:00:00/,/07:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour7
sed -n "/07:00:00/,/08:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour8
sed -n "/08:00:00/,/09:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour9
sed -n "/09:00:00/,/10:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour10
sed -n "/10:00:00/,/11:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour11
sed -n "/11:00:00/,/12:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour12
sed -n "/12:00:00/,/13:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour13
sed -n "/13:00:00/,/14:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour14
sed -n "/14:00:00/,/15:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour15
sed -n "/15:00:00/,/16:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour16
sed -n "/16:00:00/,/17:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour17
sed -n "/17:00:00/,/18:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour18
sed -n "/18:00:00/,/19:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour19
sed -n "/19:00:00/,/20:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour20
sed -n "/20:00:00/,/21:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour21
sed -n "/21:00:00/,/22:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour22
sed -n "/22:00:00/,/23:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour23
sed -n "/23:00:00/,/00:00:00/p" "$file" >/home/dilshan/Desktop/code4/hours/hour24




sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour1
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour2
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour3
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour4
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour5
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour6
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour7
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour8
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour9
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour10
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour11
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour12
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour13
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour14
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour15
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour16
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour17
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour18
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour19
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour20
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour21
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour22
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour23
sed -i '$ d' /home/dilshan/Desktop/code4/hours/hour24


yellow='\033[0;33m'
    reset='\033[0m'
    echo -e "${yellow}//////////////////////////////////////////////////// Date = $date1 ////////////////////////////////////////////////////////////${reset}"

#echo "///////////////////////////////// Date = $file /////////////////////////////////////////"


for word in "${count[@]}"; do


    grep "$word" /home/dilshan/Desktop/code4/hours/hour1 | awk -F"=" '{sum += $2} END {print "00:00-01:00   " sum}' >/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour2 | awk -F"=" '{sum += $2} END {print "01:00-02:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour3 | awk -F"=" '{sum += $2} END {print "02:00-03:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour4 | awk -F"=" '{sum += $2} END {print "03:00-04:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour5 | awk -F"=" '{sum += $2} END {print "04:00-05:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour6 | awk -F"=" '{sum += $2} END {print "05:00-06:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour7 | awk -F"=" '{sum += $2} END {print "06:00-07:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour8 | awk -F"=" '{sum += $2} END {print "07:00-08:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour9 | awk -F"=" '{sum += $2} END {print "08:00-09:00   " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour10 | awk -F"=" '{sum += $2} END {print "09:00-10:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour11 | awk -F"=" '{sum += $2} END {print "10:00-11:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour12 | awk -F"=" '{sum += $2} END {print "11:00-12:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour13 | awk -F"=" '{sum += $2} END {print "12:00-13:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour14 | awk -F"=" '{sum += $2} END {print "13:00-14:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour15 | awk -F"=" '{sum += $2} END {print "14:00-15:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour16 | awk -F"=" '{sum += $2} END {print "15:00-16:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour17 | awk -F"=" '{sum += $2} END {print "16:00-17:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour18 | awk -F"=" '{sum += $2} END {print "17:00-18:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour19 | awk -F"=" '{sum += $2} END {print "18:00-19:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour20 | awk -F"=" '{sum += $2} END {print "19:00-20:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour21 | awk -F"=" '{sum += $2} END {print "20:00-21:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour22 | awk -F"=" '{sum += $2} END {print "21:00-22:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour23 | awk -F"=" '{sum += $2} END {print "22:00-23:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt
    grep "$word" /home/dilshan/Desktop/code4/hours/hour24 | awk -F"=" '{sum += $2} END {print "23:00-24:00  " sum}' >>/home/dilshan/Desktop/code4/data_para/data"$word".txt



    awk 'NF > 1' /home/dilshan/Desktop/code4/data_para/data"$word".txt > /home/dilshan/Desktop/code4/para/"$word".txt 



    
    echo "$date1 $word"

    termgraph < /home/dilshan/Desktop/code4/para/"$word".txt
    

done



done



