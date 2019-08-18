#!/bin/bash

sudo rm Jackett.Binaries.LinuxAMDx64.tar.gz
sudo service jackett stop
echo "Stopping Jackett service."
sleep 5
sudo rm -r /opt/Jackett/
echo "Current Jackett directory removed."
release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4)
sudo wget -q https://github.com/Jackett/Jackett/releases/download/$release/Jackett.Binaries.LinuxAMDx64.tar.gz
echo "Downloaded latest Jackett release."
sudo tar -xf Jackett*
echo "Extracted latest Jackett Release."
sudo chown -R duke:duke /opt/Jackett/
cd /opt/Jackett/
sudo ./install_service_systemd.sh
cd /opt/
sudo rm Jackett.Binaries.LinuxAMDx64.tar.gz
echo "Removed Jackett installer tar."
echo "Script complete."
