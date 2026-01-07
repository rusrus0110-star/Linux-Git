#!/bin/bash
# шебанг -необходим для запуска скрипта, указывает, что скрипт должен выполняться Bash



# переменные - директория, где хранятся логи Apache, директория, куда будут сохраняться архивы, 
# текущая дата и время для уникального имени архива

LOG_DIR="/var/log/httpd"
BACKUP_DIR="/home/ec2-user/backup_httpd"
DATE=$(date '+%Y%m%d-%T')

# создаем директорию для бэкапов, так как она не существует

mkdir -p $BACKUP_DIR

# Полный путь к архиву, который будет создан

ARHIVE="$BACKUP_DIR/log-httpd-$DATE.tar.gz"

# Создаём архив всех логов Apache

tar -czf "$ARHIVE" "$LOG_DIR"/

# Останавливаем Apache, чтобы безопасно очистить логи

service httpd stop

# Удаляем все файлы логов

rm -rf "$LOG_DIR"/*

# Запускаем Apache снова — он создаст новые пустые логи

service httpd start

# Удаляем архивы старше 3 дней

find $BACKUP_DIR -type f -name "log-httpd-*" -mtime +3 -exec rm -rf {} \;




