#!/bin/bash

# UPDATE : checkout https://get.docker.com  https://github.com/docker/docker-install

DOCKER_COMPOSE_VERSION=1.24.0

yum update -y
yum install -y epel-release

## DOCKER CE
# https://docs.docker.com/install/linux/docker-ce/centos/
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker
sudo systemctl start docker


## DOCKER-COMPOSE
# https://docs.docker.com/compose/install/#install-compose
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# add user to docker group
# https://docs.docker.com/install/linux/linux-postinstall/
sudo usermod -aG docker $USER
# logout and log in back again
