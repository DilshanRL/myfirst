#!/bin/bash

awk -F " " '{print $1" "$2" "$3"\t"$9" "$10" "$11" "$12" "$13" "$14" "$15}' NgwStats.3 >test1


echo "Enter start time (format: MMM DD HH:MM:SS): "
read -r X
echo "Enter end time (format: MMM DD HH:MM:SS): "
read -r Y



sed -n "/$X/,/$Y/p" test1 >test2



grep "sendSms" test2 | awk -F"=" '{sum += $2} END {print "sendSms " sum}' >data.txt
grep "sendSmsError" test2 | awk -F"=" '{sum += $2} END {print "sendSmsError " sum}' >>data.txt
grep "notifySmsReceptionFailure" test2 | awk -F"=" '{sum += $2} END {print "notifySmsReceptionFailure " sum}' >>data.txt
grep "notifySmsDeliveryReceiptFailure" test2 | awk -F"=" '{sum += $2} END {print "notifySmsDeliveryReceiptFailure " sum}' >>data.txt
grep "notifySmsReception" test2 | awk -F"=" '{sum += $2} END {print "notifySmsReception " sum}' >>data.txt
grep "notifySmsDeliveryReceipt" test2 | awk -F"=" '{sum += $2} END {print "notifySmsDeliveryReceipt " sum}' >>data.txt
grep "sendSmsResponse" test2 | awk -F"=" '{sum += $2} END {print "sendSms-Response " sum}' >>data.txt
grep "sendSmsResponseFailure" test2 | awk -F"=" '{sum += $2} END {print "sendSms-ResponseFailure " sum}' >>data.txt
grep "GenericNack IN" test2 | awk -F"=" '{sum += $2} END {print "GenericNack-IN " sum}' >>data.txt
grep "GenericNack OUT" test2 | awk -F"=" '{sum += $2} END {print "GenericNack-OUT " sum}' >>data.txt
grep 'BindTX"' test2 | awk -F"=" '{sum += $2} END {print "BindTX " sum}' >>data.txt
grep "BindTX Resp" test2 | awk -F"=" '{sum += $2} END {print "BindTX-Resp " sum}' >>data.txt
grep 'Unbind"' test2 | awk -F"=" '{sum += $2} END {print "Unbind " sum}' >>data.txt
grep "Unbind Resp" test2 | awk -F"=" '{sum += $2} END {print "Unbind-Resp " sum}' >>data.txt
grep 'SubmitSM"' test2 | awk -F"=" '{sum += $2} END {print "SubmitSM " sum}' >>data.txt
grep "SubmitSM Resp" test2 | awk -F"=" '{sum += $2} END {print "SubmitSM-Resp " sum}' >>data.txt
grep "SubmitSmMulti" test2 | awk -F"=" '{sum += $2} END {print "SubmitSmMulti " sum}' >>data.txt
grep "SubmitSmMultiResp" test2 | awk -F"=" '{sum += $2} END {print "SubmitSmMulti-Resp " sum}' >>data.txt
grep "Enquire Link PDUs sent" test2 | awk -F"=" '{sum += $2} END {print "Enquire-Link-PDUs-sent " sum}' >>data.txt
grep "Enquire Link Rsp PDUs received" test2 | awk -F"=" '{sum += $2} END {print "Enquire-Link-Rsp-PDUs-received " sum}' >>data.txt
grep "Enquire Link PDUs recevied" test2 | awk -F"=" '{sum += $2} END {print "Enquire-Link-PDUs-recevied " sum}' >>data.txt
grep "Enquire Link Rsp PDUs sent" test2 | awk -F"=" '{sum += $2} END {print "Enquire-Link-Rsp-PDUs-sent " sum}' >>data.txt
grep "DeliverSM" test2 | awk -F"=" '{sum += $2} END {print "DeliverSM " sum}' >>data.txt
grep "DeliverSMResp" test2 | awk -F"=" '{sum += $2} END {print "DeliverSM-Resp " sum}' >>data.txt


#cat data.txt

#echo "Do you want a graph of all? (y/n)"
#read -r Y || n
termgraph < data.txt
