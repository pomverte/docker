#!/bin/bash

yum update -y
yum install -y epel-release

## DOCKER CE
# https://docs.docker.com/engine/installation/linux/docker-ce/centos/
yum remove docker \
    docker-common \
    docker-selinux \
    docker-engine

yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

sudo systemctl enable docker
sudo systemctl start docker


## DOCKER-COMPOSE
# https://docs.docker.com/compose/install/
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
