#!/bin/bash

set -eu
os=$1
if [ "$os" != "ubuntu" ]; then
  exit
fi

set -x

DOCKERHUB_TAG=$DOCKER_ORG/terraspace:ubuntu
DOCKERHUB_LATEST=$DOCKER_ORG/terraspace:latest
ECR=$ECR_REPO:latest

docker tag $DOCKERHUB_TAG $DOCKERHUB_LATEST
docker push $DOCKERHUB_LATEST

docker tag $DOCKERHUB_TAG $ECR_LATEST
docker push $ECR_LATEST
