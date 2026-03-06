#!/bin/bash

# Fetch Docker login credentials from AWS Secrets Manager
DOCKER_USERNAME=$(aws secretsmanager get-secret-value --secret-id dockersecret --query 'SecretString' --output text | jq -r .DOCKER_USERNAME)
DOCKER_PASSWORD=$(aws secretsmanager get-secret-value --secret-id dockersecret --query 'SecretString' --output text | jq -r .DOCKER_PASSWORD)

# Perform Docker login
echo "$DOCKER_PASSWORD" | sudo docker login -u "$DOCKER_USERNAME" --password-stdin
