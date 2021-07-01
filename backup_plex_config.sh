#!/bin/bash


# Plex Database Location. The trailing slash is 
# needed and important for rsync.
plexDatabase="/opt/PlexLibrary/Library/Application Support/Plex Media Server"


# Location to backup the directory to.
backupDirectory="/mnt/share/CloudData/backups/plex"


# Log file for script's output named with 
# the script's name, date, and time of execution.
scriptName=$(basename ${0})
log="/tmp/plex_backup.log"


# Check for root permissions
if [[ $EUID -ne 0 ]]; then
echo -e "${scriptName} requires root privileges.\n"
echo -e "sudo $0 $*\n"
exit 1
fi

# Create Log
echo -e "***********" >> $log 2>&1

# Stop Plex
echo -e "$(date '+%Y-%b-%d at %k:%M:%S') :: Stopping Plex Media Server." | tee -a $log 2>&1
sudo service plexmediaserver stop | tee -a $log 2>&1


# Backup database
echo -e "$(date '+%Y-%b-%d at %k:%M:%S') :: Starting Backup." | tee -a $log 2>&1
cd "$plexDatabase"
sudo tar cz --exclude='./Cache' -f "$backupDirectory/plex-backup.tar.gz" . >> $log 2>&1


# Restart Plex
echo -e "$(date '+%Y-%b-%d at %k:%M:%S') :: Starting Plex Media Server." | tee -a $log 2>&1
sudo service plexmediaserver start | tee -a $log 2>&1


# Done
echo -e "$(date '+%Y-%b-%d at %k:%M:%S') :: Backup Complete." | tee -a $log 2>&1
echo -e "***********" >> $log 2>&1
