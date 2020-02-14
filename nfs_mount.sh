#!/bin/sh
# Mount an NFS share on Android

# Requirements:
# - Busybox
# - A kernel supporting nfs (either built-in or as a module)

# On my Nexus 7 2012 I use the following kernel:
#   http://forum.xda-developers.com/showthread.php?t=2107224
# Remember: if you have problems of system space, simply delete some of the default stuff.

LOCAL_DIRECTORY="/data/media/0/2TB"
REMOTE_URI="192.168.1.101:/srv/nfs/2TB" 

# Yes, we need to set permissive SeLinux in order for this to work
# At least on Android 5.0, obviously
setenforce Permissive

# Create the mount directory, if needed
mkdir -p $LOCAL_DIRECTORY

# And actually mount what you need
# You can't mount to /sdcard/ but you CAN mount to /data/media/0
# Better mount ro, BTW
busybox mount -t nfs -o nolock,ro $REMOTE_URI $LOCAL_DIRECTORY
