#!/bin/bash

TARGET="linux.itcareerhub.de"
fail_count=0

while true; do
 output=$(ping -c 1 -W 1 "$TARGET" 2>/dev/null)
 if [ $? -eq 0 ]; then
time_ms=$(echo "$output" | grep -oP 'time=\K[0-9.]+')
 echo "Ответ от $TARGET: ${time_ms} ms"
 if (( $(echo "$time_ms > 100" | bc -l) )); then
echo "Время отклика превышает 100 мс!"
 fi
 fail_count=0
echo " Пинг не удался"
 ((fail_count++))
if [ $fail_count -ge 3 ]; then
 echo "3 последовательных ошибки пинга!"
 fail_count=0
 fi
fi
 sleep 1
done

