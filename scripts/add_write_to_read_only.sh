#!/bin/sh
set -xe
# check /dev/mmcblk0p1 exists or not
if [ ! -e /dev/mmcblk0p1 ]; then
  echo "Disk not found."
  exit 0
fi
# scan for any errors in files and fix it change disk name according to use
sudo fsck -y /dev/mmcblk0p1
# remount the system with read and write
sudo mount -o remount,rw /dev/mmcblk0p1 /mnt

