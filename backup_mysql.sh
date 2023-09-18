#!/bin/bash
# Author : Lalatendu Swain | https://github.com/Lalatenduswain
# Website: https://blog.lalatendu.info
# MySQL database information
db_user="lalatendu"
db_password="swain"
db_name="YourDataBaseName"

# Backup directory
backup_dir="/opt/BackUp/DBBackUp"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# Create a filename with the current date and time
current_date_time=$(date '+%Y-%m-%d_%H-%M-%S')
backup_filename="${db_name}_${current_date_time}.sql.gz"

# Perform the database backup using mysqldump and compress it
mysqldump -u"${db_user}" -p"${db_password}" "${db_name}" | gzip > "${backup_dir}/${backup_filename}"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Database backup created successfully: ${backup_dir}/${backup_filename}"
else
  echo "Failed to create database backup."
fi

# Remove old backups, keeping the latest 10
cd "$backup_dir" || exit
ls -t | tail -n +11 | xargs -r rm

# Exit the script
exit 0
