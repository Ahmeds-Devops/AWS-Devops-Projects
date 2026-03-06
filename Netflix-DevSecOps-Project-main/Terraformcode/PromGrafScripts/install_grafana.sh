#!/bin/bash

# Step 1: Install Dependencies
echo "Updating package list and installing dependencies..."
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common

# Step 2: Add the GPG Key
echo "Adding GPG key for Grafana..."
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

# Step 3: Add Grafana Repository
echo "Adding Grafana repository..."
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Step 4: Update and Install Grafana
echo "Updating package list and installing Grafana..."
sudo apt-get update
sudo apt-get -y install grafana

# Step 5: Enable and Start Grafana Service
echo "Enabling Grafana service to start on boot..."
sudo systemctl enable grafana-server

echo "Starting Grafana service..."
sudo systemctl start grafana-server
