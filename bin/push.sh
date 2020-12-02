#!/bin/bash

set -eux

os=$1

bin/login.sh

DOCKERHUB=$DOCKER_ORG/terraspace:$os
ECR=$ECR_REPO:$os

docker push $DOCKERHUB

docker tag $DOCKERHUB $ECR
docker push $ECR
