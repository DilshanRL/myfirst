#!/bin/bash

cp /home/dilshan/Desktop/ngw/logs/* /home/dilshan/Desktop/FinalCode2

output_file="combinedlog.txt"
log_files=("NgwStats.9" "NgwStats.8" "NgwStats.7" "NgwStats.6" "NgwStats.5" "NgwStats.4" "NgwStats.3" "NgwStats.2" "NgwStats.1" "NgwStats.0")

>"$output_file"


for file in "${log_files[@]}"; do 
    cat "$file" >>"$output_file"
done


awk -F " " '{print $1" "$2" "$3"\t"$9" "$10" "$11" "$12" "$13" "$14" "$15}' combinedlog.txt >test1

echo "Enter start date (format: MMM DD): "
read -r X

grep "$X" test1 >test1.1



count=("sendSms" "sendSmsError" "notifySmsReceptionFailure" "notifySmsDeliveryReceiptFailure" "notifySmsReception" "notifySmsDeliveryReceipt" "sendSmsResponse" "sendSmsResponseFailure" "GenericNack IN" "GenericNack OUT" "BindTX" "BindTX Resp" "Unbind" "Unbind Resp" "SubmitSM" "SubmitSM Resp" "SubmitSmMulti" "SubmitSmMultiResp" "Enquire Link PDUs sent" "Enquire Link Rsp PDUs received" "Enquire Link PDUs recevied" "Enquire Link Rsp PDUs sent" "DeliverSM" "DeliverSMResp")

# Set the field separator to a space
IFS=" "

# Iterate over the elements of the list
i=0
for item in "${count[@]}"
do
    echo "$i. $item"
    i=$((i+1))
done


# Get start and end times from user input
echo "Enter the No.(0-23) of parameter that you want : "
read -r num

if [ $num -eq 0 ]
    then echo "sendSms"
    Z='sendSms"'
fi

if [ $num -eq 1 ]
    then echo "sendSmsError"
    Z="sendSmsError"
fi

if [ $num -eq 2 ]
    then echo "notifySmsReceptionFailure"
    Z="notifySmsReceptionFailure"
fi

if [ $num -eq 3 ]
    then echo "notifySmsDeliveryReceiptFailure"
    Z="notifySmsDeliveryReceiptFailure"
fi

if [ $num -eq 4 ]
    then echo "notifySmsReception"
    Z='notifySmsReception"'
fi

if [ $num -eq 5 ]
    then echo "notifySmsDeliveryReceipt"
    Z='notifySmsDeliveryReceipt"'
fi

if [ $num -eq 6 ]
    then echo "sendSmsResponse"
    Z='sendSmsResponse"'
fi

if [ $num -eq 7 ]
    then echo "sendSmsResponseFailure"
    Z="sendSmsResponseFailure"
fi

if [ $num -eq 8 ]
    then echo "GenericNack IN"
    Z="GenericNack IN"
fi

if [ $num -eq 9 ]
    then echo "GenericNack OUT"
    Z="GenericNack OUT"
fi

if [ $num -eq 10 ]
    then echo "BindTX"
    Z='BindTX"'
fi

if [ $num -eq 11 ]
    then echo "BindTX Resp"
    Z="BindTX Resp"
fi

if [ $num -eq 12 ]
    then echo "Unbind"
    Z='Unbind"'
fi

if [ $num -eq 13 ]
    then echo "Unbind Resp"
    Z="Unbind Resp"
fi

if [ $num -eq 14 ]
    then echo "SubmitSM"
    Z='SubmitSM"'
fi

if [ $num -eq 15 ]
    then echo "SubmitSM Resp"
    Z="SubmitSM Resp"
fi

if [ $num -eq 16 ]
    then echo "SubmitSmMulti"
    Z="SubmitSmMulti"
fi

if [ $num -eq 17 ]
    then echo "SubmitSmMultiResp"
    Z='SubmitSmMultiResp"'
fi

if [ $num -eq 18 ]
    then echo "Enquire Link PDUs sent"
    Z="Enquire Link PDUs sent"
fi

if [ $num -eq 19 ]
    then 
    yellow='\033[0;33m'
    reset='\033[0m'
    echo -e "${yellow}Enquire Link Rsp PDUs received${reset}"
    Z="Enquire Link Rsp PDUs received"
fi

if [ $num -eq 20 ]
    then echo "Enquire Link PDUs recevied"
    Z="Enquire Link PDUs recevied"
fi

if [ $num -eq 21 ]
    then echo "Enquire Link Rsp PDUs sent"
    Z="Enquire Link Rsp PDUs sent"
fi

if [ $num -eq 22 ]
    then echo "DeliverSM"
    Z='DeliverSM"'
fi

if [ $num -eq 23 ]
    then echo "DeliverSMResp"
    Z="DeliverSMResp"
fi


grep  "$Z" test1.1 >test3



sed -n "/00:00:00/,/01:00:00/p" test3 >hour1
sed -n "/01:00:00/,/02:00:00/p" test3 >hour2
sed -n "/02:00:00/,/03:00:00/p" test3 >hour3
sed -n "/03:00:00/,/04:00:00/p" test3 >hour4
sed -n "/04:00:00/,/05:00:00/p" test3 >hour5 
sed -n "/05:00:00/,/06:00:00/p" test3 >hour6
sed -n "/06:00:00/,/07:00:00/p" test3 >hour7
sed -n "/07:00:00/,/08:00:00/p" test3 >hour8
sed -n "/08:00:00/,/09:00:00/p" test3 >hour9
sed -n "/09:00:00/,/10:00:00/p" test3 >hour10
sed -n "/10:00:00/,/11:00:00/p" test3 >hour11
sed -n "/11:00:00/,/12:00:00/p" test3 >hour12
sed -n "/12:00:00/,/13:00:00/p" test3 >hour13
sed -n "/13:00:00/,/14:00:00/p" test3 >hour14
sed -n "/14:00:00/,/15:00:00/p" test3 >hour15
sed -n "/15:00:00/,/16:00:00/p" test3 >hour16
sed -n "/16:00:00/,/17:00:00/p" test3 >hour17
sed -n "/17:00:00/,/18:00:00/p" test3 >hour18
sed -n "/18:00:00/,/19:00:00/p" test3 >hour19
sed -n "/19:00:00/,/20:00:00/p" test3 >hour20
sed -n "/20:00:00/,/21:00:00/p" test3 >hour21
sed -n "/21:00:00/,/22:00:00/p" test3 >hour22
sed -n "/22:00:00/,/23:00:00/p" test3 >hour23
sed -n "/23:00:00/,/00:00:00/p" test3 >hour24



sed -i '$ d' hour1
sed -i '$ d' hour2
sed -i '$ d' hour3
sed -i '$ d' hour4
sed -i '$ d' hour5
sed -i '$ d' hour6
sed -i '$ d' hour7
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

grep "$Z" hour1 | awk -F"=" '{sum += $2} END {print "1st    " sum}' >data.txt
grep "$Z" hour2 | awk -F"=" '{sum += $2} END {print "2nd    " sum}' >>data.txt
grep "$Z" hour3 | awk -F"=" '{sum += $2} END {print "3rd    " sum}' >>data.txt
grep "$Z" hour4 | awk -F"=" '{sum += $2} END {print "4th    " sum}' >>data.txt
grep "$Z" hour5 | awk -F"=" '{sum += $2} END {print "5th    " sum}' >>data.txt
grep "$Z" hour6 | awk -F"=" '{sum += $2} END {print "6th    " sum}' >>data.txt
grep "$Z" hour7 | awk -F"=" '{sum += $2} END {print "7th    " sum}' >>data.txt
grep "$Z" hour8 | awk -F"=" '{sum += $2} END {print "8th    " sum}' >>data.txt
grep "$Z" hour9 | awk -F"=" '{sum += $2} END {print "9th    " sum}' >>data.txt
grep "$Z" hour10 | awk -F"=" '{sum += $2} END {print "10th  " sum}' >>data.txt
grep "$Z" hour11 | awk -F"=" '{sum += $2} END {print "11th  " sum}' >>data.txt
grep "$Z" hour12 | awk -F"=" '{sum += $2} END {print "12th  " sum}' >>data.txt
grep "$Z" hour13 | awk -F"=" '{sum += $2} END {print "13th  " sum}' >>data.txt
grep "$Z" hour14 | awk -F"=" '{sum += $2} END {print "14th  " sum}' >>data.txt
grep "$Z" hour15 | awk -F"=" '{sum += $2} END {print "15th  " sum}' >>data.txt
grep "$Z" hour16 | awk -F"=" '{sum += $2} END {print "16th  " sum}' >>data.txt
grep "$Z" hour17 | awk -F"=" '{sum += $2} END {print "17th  " sum}' >>data.txt
grep "$Z" hour18 | awk -F"=" '{sum += $2} END {print "18th  " sum}' >>data.txt
grep "$Z" hour19 | awk -F"=" '{sum += $2} END {print "19th  " sum}' >>data.txt
grep "$Z" hour20 | awk -F"=" '{sum += $2} END {print "20th  " sum}' >>data.txt
grep "$Z" hour21 | awk -F"=" '{sum += $2} END {print "21st  " sum}' >>data.txt
grep "$Z" hour22 | awk -F"=" '{sum += $2} END {print "22nd  " sum}' >>data.txt
grep "$Z" hour23 | awk -F"=" '{sum += $2} END {print "23rd  " sum}' >>data.txt
grep "$Z" hour24 | awk -F"=" '{sum += $2} END {print "24th  " sum}' >>data.txt

awk 'NF > 1' data.txt >data1.txt


termgraph < data1.txt



for file in "${log_files[@]}"; do 
    rm "$file"
done