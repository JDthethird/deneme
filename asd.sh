#!/bin/bash

SOURCE_DIR="/fbapp/logs/LEASINGTEST/reports"
BACKUP_DIR="/fbapp/backup/LogBackups/LEASINGTEST"

TIMESTAMP=$(date +"%Y%m%d%H%M")
ZIP_FILE="logs_backup_$TIMESTAMP.zip"

mkdir -p "$BACKUP_DIR"

zip -r "$BACKUP_DIR/$ZIP_FILE" "$SOURCE_DIR"/*.log

if [ $? -eq 0 ]; then
    echo "Log dosyaları başarıyla yedeklendi: $BACKUP_DIR/$ZIP_FILE"
fi
