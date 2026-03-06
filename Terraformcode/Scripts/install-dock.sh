#!/bin/bash
# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io git
sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.sock

# Wait for Docker to be fully started
sleep 20
