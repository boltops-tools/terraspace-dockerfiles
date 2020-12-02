#!/bin/bash

set -eu
os=$1
if [ "$os" != "ubuntu" ]; then
  exit
fi

set -x

OS_TAG=$DOCKER_ORG/terraspace:ubuntu
DOCKERHUB=$DOCKER_ORG/terraspace:latest
ECR=$ECR_REPO:latest

docker tag $OS_TAG $DOCKERHUB
docker push $DOCKERHUB

docker tag $OS_TAG $ECR
docker push $ECR
