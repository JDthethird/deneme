#!/bin/bash

# Kaynak ve hedef dizinler
SOURCE_DIR="/fbapp/logs/LEASINGTEST/reports"
BACKUP_DIR="/backup"

# Zaman damgası ekleyerek zip dosyası adı oluştur
TIMESTAMP=$(date +"%Y%m%d")
ZIP_FILE="logs_backup_$TIMESTAMP.zip"

# log dosyalarını zipleyip backup dizinine taşı
zip -r "$BACKUP_DIR/$ZIP_FILE" "$SOURCE_DIR"/*.log

# İşlem başarılı olduysa mesaj yazdır
if [ $? -eq 0 ]; then
    echo "Log dosyaları başarıyla yedeklendi: $BACKUP_DIR/$ZIP_FILE"
else
    echo "Yedekleme işlemi başarısız oldu!"
fi
