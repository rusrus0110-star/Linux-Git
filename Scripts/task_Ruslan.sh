#!/bin/bash

OUTPUTDIR="/opt/190925-wdm/Ruslan/CronTask"
for i  in  {1..10}
do
DATE=$(date +"%d.%m.%y")
FILENAME="${i}_${DATE}.txt"
echo "File N$i created $(date)" > "$OUTPUTDIR/$FILENAME"
done
