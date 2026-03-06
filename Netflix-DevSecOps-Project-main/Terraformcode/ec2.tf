resource "aws_instance" "Netflixserver" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.NetflixPublicSubnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.Netflixsecuritygroup.id ]
  iam_instance_profile   = aws_iam_instance_profile.NetflixInstanceProfile.name  # Add this line

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "Netflixserver"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Ahmed.pem")
    host        = self.public_ip
  }

  # Create the directory on the instance
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ubuntu/scripts"
    ]
  }

  # Copy scripts to the instance
  provisioner "file" {
    source      = "${path.module}/Scripts/"
    destination = "/home/ubuntu/scripts/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y unzip",
      "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'",
      "unzip awscliv2.zip",
      "sudo ./aws/install",
    ]
  }

  # Run the scripts after copying
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/scripts/*.sh",
      "sudo /home/ubuntu/scripts/install-dock.sh",
      "sudo /home/ubuntu/scripts/configure_and_login.sh",
      "sudo /home/ubuntu/scripts/clone_repo.sh",
      "sudo /home/ubuntu/scripts/build_and_run_docker.sh",
      "sudo /home/ubuntu/scripts/install_sonarqube.sh",
      "sudo /home/ubuntu/scripts/install_trivy.sh",
      "sudo /home/ubuntu/scripts/install_jenkins.sh"
    ]
  }
}

resource "aws_iam_instance_profile" "NetflixInstanceProfile" {
  name = "NetflixInstanceProfile"
  role = aws_iam_role.NetflixInstanceRole.name
}

resource "aws_instance" "monitoringinstances" {
  ami = var.ami
  instance_type = var.montoringinstance_type
  key_name = var.key_name
  subnet_id = aws_subnet.NetflixPublicSubnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.Netflixsecuritygroup.id ]
  
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    
    }

  tags = {
    Name = "monitoringinstances"
    }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Ahmed.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ubuntu/scripts"
    ]
  }

  # Copy scripts to the instance
  provisioner "file" {
    source      = "${path.module}/PromGrafScripts/"
    destination = "/home/ubuntu/scripts/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "chmod +x /home/ubuntu/scripts/*.sh",
      "sudo /home/ubuntu/scripts/install_prometheus.sh",
      "sudo /home/ubuntu/scripts/install_nodeexporter.sh",
      "sudo /home/ubuntu/scripts/install_grafana.sh"
    ]
  }
}