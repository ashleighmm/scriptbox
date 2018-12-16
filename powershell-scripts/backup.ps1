### Create a backup when user runs 'backup' in the terminal
# Ask the user to enter the source path of their backup
# Save their input as a variable called 'BACKUPFOLDER'
#$BACKUPFOLDER = Read-Host -Prompt "Which folder would you like to backup?"

# Ask the user to enter the destination path of their backup
# Save their input as a variable called 'BACKUPDEST'
#$BACKUPDEST = Read-Host -Prompt "Where would you like to save your backup?"

# Make a directory in the user's local profile with their destination path included as part of the path
#new-item -Name $BACKUPDEST -ItemType directory

# Create archive filename with the current date (yyyymmdd) as a variable called 'day'
#$day = Get-Date
#($day).ToString("yyyyMMdd")
# Create a variable which holds the name of the backup file including date
#$archive_file="$day.tgz"

#Print status message to alert user that the backup has begun
#Write-Host "Backing up $BACKUPFOLDER to $BACKUPDEST/$archive_file"

# Backup the files using tar format and set the destination and backup filename


# Create a zip file with the contents of your website file
$backupfolder = Read-Host -Prompt "Which folder would you like to backup?"
Write-Host "Backing up $BACKUPFOLDER to $BACKUPDEST/$archive_file"

$time = (Get-Date).ToString("yyyy:MM:dd")
$backup = "C:\Users\Ashleigh\Documents\backups"
if( -Not (Test-Path -Path $backup ) )
{
    New-Item -ItemType directory -Path $backup
}
$destination = "$backup\Backup-$time.zip"
Compress-Archive -Path $backupfolder -DestinationPath $destination
# Print end status message
Write-Host "Backup Finished"



