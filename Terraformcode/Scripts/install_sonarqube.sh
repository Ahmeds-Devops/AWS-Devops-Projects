#!/bin/bash
# Install and run SonarQube
sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
