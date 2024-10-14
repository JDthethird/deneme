#!/bin/bash

SOURCE_DIR="/fbapp/logs/LEASINGTEST/reports"
BACKUP_DIR="/fbapp/backup/LogBackups/LEASINGTEST"

TIMESTAMP=$(date +"%y%m%d%H%M")
ZIP_FILE="logs_backup_$TIMESTAMP.zip"
NEW_DIR="$BACKUP_DIR/$TIMESTAMP"

mkdir -p "$NEW_DIR"

zip -r "$NEW_DIR/$ZIP_FILE" "$SOURCE_DIR"/*

if [ $? -eq 0 ]; then
    rm -rf "$SOURCE_DIR"/*
    echo "dosyalar yedeklendi: $NEW_DIR/$ZIP_FILE"
fi
