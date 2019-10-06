#!/bin/bash

# Run script as root to reinstall jackett, if it fails during an auto-update.

sudo rm /opt/Jackett.Binaries.LinuxAMDx64.tar.gz
sudo service jackett stop
echo "Stopping Jackett service."
sleep 5
sudo rm -r /opt/Jackett/
echo "Current Jackett directory removed."
release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4)
sudo wget -q https://github.com/Jackett/Jackett/releases/download/$release/Jackett.Binaries.LinuxAMDx64.tar.gz
echo "Downloaded latest Jackett release."
sudo tar -xf /opt/Jackett*
echo "Extracted latest Jackett Release."
sudo chown -R duke:duke /opt/Jackett/
sudo /opt/Jackett/install_service_systemd.sh
sudo rm /opt/Jackett.Binaries.LinuxAMDx64.tar.gz
echo "Removed Jackett installer tar."
echo "Script complete."
