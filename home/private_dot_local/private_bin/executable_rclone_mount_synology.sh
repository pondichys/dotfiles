#!/usr/bin/env bash

# Mount Synology NAS shared folders
# Mount $HOME/Documents folder
rclone --vfs-cache-mode writes mount synology_drive:home/Drive/Documents ~/Documents &
