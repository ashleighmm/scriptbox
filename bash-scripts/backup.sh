#!/bin/bash

### Create a backup when user runs 'backup' in the terminal
# Ask the user to enter the source path of their backup
echo "Which folder would you like to backup?"
# Save their input as a variable called 'BACKUPFOLDER'
read BACKUPFOLDER

# Ask the user to enter the destination path of their backup
echo "Where would you like to save your backup?"
# Save their input as a variable called 'BACKUPDEST'
read BACKUPDEST

# Make a directory in the user's local profile (home/user/) with their destination path included as part of the path
mkdir "$HOME/$BACKUPDEST"

# Save the full destination path as a variable called 'dest'
dest="$HOME/$BACKUPDEST"

# Create archive filename with the current date (yyyymmdd) as a variable called 'day'
day=$(date +%Y-%m-%d)
# Save the current user's hostname as a variable
hostname=$(hostname -s)
# Create a variable which holds the name of the backup file including the hostname and date
archive_file="$hostname-$day.tgz"

#Print status message to alert user that the backup has begun
echo "Backing up $BACKUPFOLDER to $dest/$archive_file"
date
echo

# Backup the files using tar format and set the destination and backup filename
tar czf $dest/$archive_file $backup_files

# Print end status message
echo
echo "Backup Finished"
date

# Long listing of files in $dest to check file sizes
ls -lh $dest



