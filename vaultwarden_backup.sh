#!/bin/sh

find /opt/vaultwarden/backup/* -mtime +60 -type f -exec rm {} \;
zip -r "/opt/vaultwarden/backup/vaultwarden_backup_$(date +"%m-%d-%Y").zip" /opt/vaultwarden/data/
rclone sync "/opt/vaultwarden/backup/vaultwarden_backup_$(date +"%m-%d-%Y").zip" gdrive:Vaultwarden
rclone delete gdrive:Vaultwarden --min-age 30d
