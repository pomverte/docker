#!/bin/bash

# UPDATE : checkout https://get.docker.com  https://github.com/docker/docker-install

DOCKER_COMPOSE_VERSION = 1.21.2

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
    docker-selinux \
    docker-engine-selinux \
    docker-engine

sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce

sudo systemctl enable docker
sudo systemctl start docker


## DOCKER-COMPOSE
# https://docs.docker.com/compose/install/#install-compose
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
