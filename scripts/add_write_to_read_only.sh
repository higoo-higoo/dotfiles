#!/bin/sh
set -xe
# scan for any errors in files and fix it change disk name according to use
sudo fsck -y /dev/mmcblk0p1
# remount the system with read and write
sudo mount -o remount,rw /dev/mmcblk0p1 /mnt
