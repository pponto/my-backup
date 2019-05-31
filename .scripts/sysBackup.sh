#!/bin/sh
#
# Author: Pedro Moreira
# Purpose: My script for system backupafter a clean install
# Date Created: 4/22/2019
# Date Modified: 4/22/2019

logger "Backup Script: Starting..."

########## Folder Settings ##########
# FROM_DIR Source directory. Use more than one if necessary
# FINAL_DIR Target directory. Final location of the backup files
# BKP_NAME Compressed backup name if you want to send externally
# FULL_DIR Full system backup
FROM_DIR=~/.scripts
#FROM_DIR2=~/.ssh
FROM_DIR3=~/.themes
FROM_DIR4=~/.fonts
FROM_DIR5=~/.icons
FROM_DIR6=~/.config/compton
FROM_DIR7=~/.config/dunst
FROM_DIR8=~/.config/i3
FROM_DIR9=~/.config/i3blocks
FROM_DIR10=~/.config/morc_menu
FROM_DIR11=~/.config/rofi
FROM_DIR12=~/.config/redshift.conf

FINAL_DIR=~/my-backup

########## Backup Process ##########
# Need to uncomment or add more lines if you use multiple folders
# and destinations.
RSYNC_SETTINGS='-vruEP --delete'
echo '[***] Starting backup of files and folders...'
rsync $RSYNC_SETTINGS $FROM_DIR $FINAL_DIR
#rsync $RSYNC_SETTINGS $FROM_DIR2 $FINAL_DIR
rsync $RSYNC_SETTINGS $FROM_DIR3 $FINAL_DIR
rsync $RSYNC_SETTINGS $FROM_DIR4 $FINAL_DIR
rsync $RSYNC_SETTINGS $FROM_DIR5 $FINAL_DIR
rsync $RSYNC_SETTINGS $FROM_DIR6 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR7 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR8 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR9 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR10 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR11 $FINAL_DIR/.config
rsync $RSYNC_SETTINGS $FROM_DIR12 $FINAL_DIR/.config

echo '[***] Seending to git.'

cd /home/pponto/my-backup

NOW=$(date +"%m_%d_%Y")
git add .
git commit -m $NOW
git push origin master

echo '[***] Backup done.'

logger "Backup Script: Done."
