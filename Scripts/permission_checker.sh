#!/bin/bash

TARGET_DIR="/opt/190925-wdm/Ruslan"

for file in "$TARGET_DIR"/*.sh;
do
 [ -e "$file" ] || { echo "No .sh file found."; exit 0; }

if [ ! -x "$file" ]; then 
echo "Adding execute permission to: $file"
chmod +x "$file"
else 
echo " Already executable: $file"
fi
done

echo "Done"

