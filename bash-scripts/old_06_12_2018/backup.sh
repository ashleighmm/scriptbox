#!/bin/bash

###Automate website backups to the network as a fall back for Github everyday.
echo "Which folder would you like to backup?"
read BACKUPFOLDER
# What to backup.
backup_files="$BACKUPFOLDER"

echo "Where would you like to save your backup?"
read BACKUPDEST
# Where to backup to.
mkdir "/home/ashleigh/$BACKUPDEST"
dest="/home/ashleigh/$BACKUPDEST"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

#Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup Finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest



