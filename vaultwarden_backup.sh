#!/bin/sh

zip -r "vaultwarden_backup_$(date +"%m-%d-%Y").zip" /opt/vaultwarden/data/
rclone copy "vaultwarden_backup_$(date +"%m-%d-%Y").zip" gdrive:Vaultwarden
