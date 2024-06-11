#!/bin/bash

# MySQL Credentials
DB_USER="root"
DB_PASS=""

# Backup directory
BACKUP_DIR="/backup/dir"
DATE=$(date +%F_%T)

# Validate MySQL credentials and backup directory
if [[ -z $DB_USER || -z $DB_PASS || -z $BACKUP_DIR ]]; then
    echo "MySQL credentials or backup directory not provided. Please provide valid credentials and backup directory."
    exit 1
fi

# Export the database
mysqldump -u $DB_USER -p$DB_PASS --all-databases > $BACKUP_DIR/db_backup_$DATE.sql

# Check if mysqldump was successful
if [ $? -ne 0 ]; then
    echo "Error: mysqldump command failed."
    exit 1
fi

# Log the backup
echo "[$DATE] Backup of $DB_NAME completed" >> $BACKUP_DIR/backup.log
