# #!/bin/bash
# # Update the package list and install Docker
# sudo apt-get update
# sudo apt-get install -y docker.io git
# sudo usermod -aG docker ubuntu
# sudo chmod 777 /var/run/docker.sock

# # Wait for Docker to be fully started
# sleep 20

# # Switch to the ubuntu user's home directory
# cd /home/ubuntu

# # Clone the repository
# git clone https://github.com/N4si/DevSecOps-Project.git

# # Change ownership of the cloned directory to the ubuntu user
# sudo chown -R ubuntu:ubuntu /home/ubuntu/DevSecOps-Project

# # Navigate to the project directory
# cd DevSecOps-Project

# # Build the Docker image
# sudo docker build --build-arg TMDB_V3_API_KEY=<yourapikey> -t netflix .

# # Run the Docker container
# sudo docker run -d -p 8081:80 netflix:latest

# # Install and run SonarQube
# sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

# # Install Trivy
# sudo apt-get install -y wget apt-transport-https gnupg lsb-release
# wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
# echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
# sudo apt-get update
# sudo apt-get install -y trivy

# #install java
# sudo apt update -y
# sudo apt install fontconfig openjdk-17-jre -y

# #jenkins
# # 1. Download and add the Jenkins GPG key to your system
# sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# # 2. Add the Jenkins apt repository to your system's software repository list
# echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# # 3. Update the package list to include the new Jenkins repository
# sudo apt-get update -y

# # 4. Install Jenkins
# sudo apt-get install jenkins -y

# # 5. Start the Jenkins service
# sudo systemctl start jenkins

# # 6. Enable Jenkins to start on boot
# sudo systemctl enable jenkins
