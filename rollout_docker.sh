sudo install cifs-common docker.io

/etc/fstab
printf "192.168.0.100:/mnt/Raid_Pool/SHARE /mnt/share nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14  0 0\n" >> /etc/fstab
printf "192.168.0.100:/mnt/Raid_Pool/SHARE/MEDIA /mnt/media nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14  0 0\n" >> /etc/fstab

mkdir -p /mnt/share
mkdir -p /mnt/media

sudo mount -a


