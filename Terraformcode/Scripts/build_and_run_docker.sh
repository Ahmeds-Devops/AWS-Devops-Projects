#!/bin/bash

DOCKER_USERNAME=$(aws secretsmanager get-secret-value --secret-id dockersecret --query 'SecretString' --output text | jq -r .DOCKER_USERNAME)
DOCKER_PASSWORD=$(aws secretsmanager get-secret-value --secret-id dockersecret --query 'SecretString' --output text | jq -r .DOCKER_PASSWORD)

# Perform Docker login
echo "$DOCKER_PASSWORD" | sudo docker login -u "$DOCKER_USERNAME" --password-stdin

# Build and run the Docker container
cd /home/ubuntu/DevSecOps-Project
sudo docker build --build-arg TMDB_V3_API_KEY=<your-api-key> -t netflix .
sudo docker run -d -p 8081:80 netflix:latest
