#!/usr/bin/env bash

# Required env vars:
#
# $VOLUME_MOUNT_POINT
# $ARCHIVE_NAME_PREFIX
# $FTP_PATH
# $FTP_USER
# $FTP_PASSWORD

FILE="$ARCHIVE_NAME_PREFIX-`date +%s`.tar.bz2"

tar -jcf /tmp/$FILE $VOLUME_MOUNT_POINT/*
cmd="curl -T /tmp/$FILE $FTP_PATH --user '$FTP_USER:$FTP_PASSWORD'"
eval "$cmd"
rm /tmp/$FILE
