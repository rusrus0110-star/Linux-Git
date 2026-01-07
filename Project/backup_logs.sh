#!/bin/bash

LOG_DIR="/var/log/httpd"
BACKUP_DIR="/home/ec2-user/backup_httpd"
DATE=$(date '+%Y%m%d-%T')

mkdir -p $BACKUP_DIR

ARHIVE="$BACKUP_DIR/log-httpd-$DATE.tar.gz"

tar -czf "$ARHIVE" "$LOG_DIR"/

service httpd stop

rm -rf "$LOG_DIR"/*

service httpd start

find $BACKUP_DIR -type f -name "log-httpd-*" -mtime +3 -exec rm -rf {} \;

