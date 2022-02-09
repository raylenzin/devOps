#!/bin/sh

# # # # # #
# Title: MySql Database Backup Script
# Version: 1.0
#
# Author: Ray Lenzin
# Contact: ray@nullgradnord.ch
# Website: http://www.nullgradnord.ch
#
# Last update: 09-02-2022
# Notes: make sure this file is executable (chmod +x filename.sh)
# # # # # #

# db vars

# server path to base backupfolder
backupPath=~/backup

# import db login data
. ./.DatabaseNameBackup.conf

# script var
timeStamp=`date +"%Y-%m-%d_%H-%M-%S"`

# msg vars
backupStart="Backup started for database ${db_name}"
backupOk="Backup is done for database ${db_name}"
backupError="Backup failed for database ${db_name}"

# create subfolder if not exist
mkdir -p ${backupPath}/${db_name}

echo $startBackup
# get data and write backup file
mysqldump -h ${db_host} \
-P ${db_port} \
-u ${db_user} \
-p${db_password} \
${db_name} > ${backupPath}/${db_name}/${db_name}-${timeStamp}.sql

if [ $? -eq 0 ]; then
echo $backupOk
else
echo $backupError
exit 1
fi