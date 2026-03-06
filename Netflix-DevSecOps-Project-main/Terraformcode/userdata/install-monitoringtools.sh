# #!/bin/bash

# #PROMETHEUS INSTALLATION COMMANDS
# # Update and install necessary packages
# sudo apt-get update -y
# sudo apt-get install wget -y

# # Create a system user for Prometheus
# sudo useradd --system --no-create-home --shell /bin/false prometheus

# # Download and extract Prometheus
# wget https://github.com/prometheus/prometheus/releases/download/v2.47.1/prometheus-2.47.1.linux-amd64.tar.gz
# tar -xvf prometheus-2.47.1.linux-amd64.tar.gz

# # Move Prometheus binaries and configuration files
# cd prometheus-2.47.1.linux-amd64/
# sudo mkdir -p /data /etc/prometheus
# sudo mv prometheus promtool /usr/local/bin/
# sudo mv consoles/ console_libraries/ /etc/prometheus/
# sudo mv prometheus.yml /etc/prometheus/prometheus.yml

# # Set ownership of Prometheus files
# sudo chown -R prometheus:prometheus /etc/prometheus/ /data/

# # Create systemd service file for Prometheus
# sudo bash -c 'cat > /etc/systemd/system/prometheus.service <<EOL
# [Unit]
# Description=Prometheus
# Wants=network-online.target
# After=network-online.target

# StartLimitIntervalSec=500
# StartLimitBurst=5

# [Service]
# User=prometheus
# Group=prometheus
# Type=simple
# Restart=on-failure
# RestartSec=5s
# ExecStart=/usr/local/bin/prometheus \\
#     --config.file=/etc/prometheus/prometheus.yml \\
#     --storage.tsdb.path=/data \\
#     --web.console.templates=/etc/prometheus/consoles \\
#     --web.console.libraries=/etc/prometheus/console_libraries \\
#     --web.listen-address=0.0.0.0:9090 \\
#     --web.enable-lifecycle

# [Install]
# WantedBy=multi-user.target
# EOL'

# # Reload systemd, enable and start Prometheus service
# sudo systemctl daemon-reload
# sudo systemctl enable prometheus
# sudo systemctl start prometheus

# #NODEEXPORT INSTALLING COMMANDS

# # Create a system user for Node Exporter
# sudo useradd --system --no-create-home --shell /bin/false node_exporter

# # Download Node Exporter
# wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

# # Extract Node Exporter files and move the binary to the appropriate location
# tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz
# sudo mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/

# # Clean up
# rm -rf node_exporter-1.6.1.linux-amd64.tar.gz node_exporter-1.6.1.linux-amd64

# # Create a systemd unit configuration file for Node Exporter
# sudo bash -c 'cat > /etc/systemd/system/node_exporter.service <<EOL
# [Unit]
# Description=Node Exporter
# Wants=network-online.target
# After=network-online.target

# StartLimitIntervalSec=500
# StartLimitBurst=5

# [Service]
# User=node_exporter
# Group=node_exporter
# Type=simple
# Restart=on-failure
# RestartSec=5s
# ExecStart=/usr/local/bin/node_exporter --collector.logind

# [Install]
# WantedBy=multi-user.target
# EOL'

# # Reload systemd, enable and start Node Exporter service
# sudo systemctl daemon-reload
# sudo systemctl enable node_exporter
# sudo systemctl start node_exporter
