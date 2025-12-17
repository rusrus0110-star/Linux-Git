#!/bin/bash
for i in {1..10}
do
 current_time=$(date +"%H:%M:%S")
 process_count=$(ps -ef | wc -l)
echo "time: $current_time  processed: $process_count"
 #sleep 5
sleep 1
done
mkdir -p /opt/190925-wdm/Ruslan/info
mkdir -p /opt/190925-wdm/Ruslan/files
cat /proc/cpuinfo > /opt/190925-wdm/Ruslan/info/cpuinfo.txt
cat /etc/os-release | grep "^NAME=" > /opt/190925-wdm/Ruslan/info/osinfo.txt
cat /etc/os-release | grep "^NAME=" | awk -F= '{print $2}' | tr -d '"' > /opt/190925-wdm/Ruslan/info/osname.txt
for i in {50..100}
do
touch /opt/190925-wdm/Ruslan/files/"$i.txt"
done
