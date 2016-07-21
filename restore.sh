#!/usr/bin/env sh
set -e

# Required env vars:
#
# $VOLUME_MOUNT_POINT
# $FTP_PATH
# $FTP_USER
# $FTP_PASSWORD

cmd="curl $FTP_PATH --user '$FTP_USER:$FTP_PASSWORD' -o /tmp/archive.tar.bz2"
eval "$cmd"
tar -jxC / -f /tmp/archive.tar.bz2
rm /tmp/archive.tar.bz2
