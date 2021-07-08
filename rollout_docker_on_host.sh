#!/bin bash

#Cifs for fileshare mount and docker obviously
sudo apt install nfs-common docker.io

# Add Media and main SHARE as mounts/etc/fstab
printf "192.168.0.100:/mnt/Raid_Pool/SHARE /mnt/share nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14  0 0\n" >> /etc/fstab
printf "192.168.0.100:/mnt/Raid_Pool/SHARE/MEDIA /mnt/media nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14  0 0\n" >> /etc/fstab
mkdir -p /mnt/share
mkdir -p /mnt/media
sudo mount -a


