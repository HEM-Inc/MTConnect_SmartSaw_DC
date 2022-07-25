#!/bin/sh

echo "Installing MTConnect Adapter and setting it as a SystemCTL... /n"

sudo useradd -r -s /bin/false adapter

sudo mkdir -p /etc/adapter/
sudo cp -r /home/hemsaw/mtconnect/adapter/. /etc/adapter/
sudo cp -r /home/hemsaw/mtconnect/afg/SmartSaw_DC.afg /etc/adapter/

sudo chmod +x /etc/adapter/Adapter
sudo chown -R adapter:adapter /etc/adapter

sudo /etc/adapter/adapter.service /etc/systemd/system/
sudo systemctl enable adapter
sudo systemctl start adapter
sudo systemctl status adapter

echo "MTConnect Adapter Up and Running /n"

echo "Installing MTConnect and setting it as a SystemCTL... /n"

sudo useradd -r -s /bin/false mtconnect
sudo mkdir /var/log/mtconnect
sudo chown mtconnect:mtconnect /var/log/mtconnect

sudo mkdir -p /etc/mtconnect/
sudo mkdir -p /etc/mtconnect/agent/
sudo mkdir -p /etc/mtconnect/devices/
sudo mkdir -p /etc/mtconnect/schema/
sudo mkdir -p /etc/mtconnect/styles/

sudo cp agent/agent /usr/bin/
sudo chmod +x /usr/bin/agent

sudo cp -r /home/hemsaw/mtconnect/agent/. /etc/mtconnect/agent/
sudo cp -r /home/hemsaw/mtconnect/devices/. /etc/mtconnect/devices/
sudo cp -r /home/hemsaw/mtconnect/schema/. /etc/mtconnect/schema/
sudo cp -r /home/hemsaw/mtconnect/styles/. /etc/mtconnect/styles/
sudo chown -R mtconnect:mtconnect /etc/mtconnect

sudo cp /etc/mtconnect/agent/agent.service /etc/systemd/system/
sudo systemctl enable agent
sudo systemctl start agent
sudo systemctl status agent

echo "MTConnect Agent Up and Running /n"