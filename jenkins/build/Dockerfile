FROM jenkins/jenkins:2.136-alpine

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ARG DOCKER_HOST_DOCKER_GID

USER root
RUN adduser jenkins users

RUN addgroup --gid ${DOCKER_HOST_DOCKER_GID} docker
RUN apk update \
    && apk add docker \
#    && apk add openrc --no-cache
#    && rc-update add docker boot \
    && adduser jenkins docker

USER jenkins
