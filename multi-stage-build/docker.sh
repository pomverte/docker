#!/usr/bin/env bash

set -e

DOCKER_REGISTRY=""
DOCKER_USER=""
DOCKER_PASSWORD=""

while getopts "u:p:" opt; do
    case ${opt} in
        u) DOCKER_USER=${OPTARG};;
        p) DOCKER_PASSWORD=${OPTARG};;
        \?) echo "Invalid option: -${OPTARG}" >&2;;
    esac
done

function info() {

    [[ ${DOCKER_USER} == "" ]] && echo "Please provide a user for docker registry" && exit 1
    [[ ${DOCKER_PASSWORD} == "" ]] && echo "Please provide a password for docker registry" && exit 1
    DOCKER_IMAGE=${DOCKER_USER}/multi-stage

    GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    GIT_COMMIT="$(git rev-parse --verify HEAD)"

    # ... so much pain to get the version
    #docker run --rm -v /work/pom.xml:/pom.xml maven:3.5-jdk-8-slim mvn -f /pom.xml org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version
    #PROJECT_VERSION="$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version)"
    PROJECT_VERSION="0.0.1"

    echo "------------------------------"
    echo git branch : ${GIT_BRANCH}
    echo git commit : ${GIT_COMMIT}
    echo project version : ${PROJECT_VERSION}
    echo docker user : ${DOCKER_USER}
    echo docker registry : ${DOCKER_REGISTRY}
    echo docker image : ${DOCKER_IMAGE}
    echo "------------------------------"

    if [[ "${GIT_BRANCH}" == "master" ]] &&
       [[ "${PROJECT_VERSION}" == *SNAPSHOT ]]; then
        echo "ERROR : master branch contains a SNAPSHOT !"
        exit 1
    fi
}

function build_image() {
    # build image with tag
    docker build -t ${DOCKER_IMAGE}:${PROJECT_VERSION} --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_COMMIT=${GIT_COMMIT} .
}

function push_tag() {
    # log into docker registry
    docker login -u=${DOCKER_USER} -p=${DOCKER_PASSWORD} ${DOCKER_REGISTRY}
    # push tag
    docker push ${DOCKER_IMAGE}:${PROJECT_VERSION}
    if [[ "${GIT_BRANCH}" == "master" ]]; then
        docker tag ${DOCKER_IMAGE}:${PROJECT_VERSION} ${DOCKER_IMAGE}:latest
        docker push ${DOCKER_IMAGE}:latest
    fi
    # logout
    docker logout
}

info
build_image
push_tag
