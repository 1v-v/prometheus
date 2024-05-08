#!/usr/bin/env bash


sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker

sudo dnf install -y wget

sudo wget https://raw.githubusercontent.com/1v-v/stuff/main/prometheus/prometheus.repo
sudo mv prometheus.repo  /etc/yum.repos.d

sudo dnf -y install node_exporter
sudo systemctl enable --now node_exporter


sudo firewall-cmd --add-port=9090/tcp --permanent
sudo firewall-cmd --reload


sudo mkdir -p  prometheus/prometheus_config 
sudo wget --directory-prefix=prometheus/prometheus_config  https://raw.githubusercontent.com/1v-v/stuff/main/prometheus/prometheus.yml
sudo wget --directory-prefix=prometheus https://raw.githubusercontent.com/1v-v/stuff/main/prometheus/docker-compose.yaml
