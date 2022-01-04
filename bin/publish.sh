#!/bin/bash

set -eux

bin/login.sh

set +u
if [[ -z "$PACKAGE_VERSION" || "$PACKAGE_VERSION" == "" || "$PACKAGE_VERSION" == "latest" ]]; then
  bin/write_package_version.sh
  PACKAGE_VERSION=$(cat package_version.txt)
  BUILD_ARG=""
else
  BUILD_ARG="--build-arg PACKAGE_VERSION=$PACKAGE_VERSION"
fi
set -u

# Build
DOCKER_LATEST=$DOCKER_ORG/terraspace:$OS
docker build $BUILD_ARG -t $DOCKER_LATEST -f Dockerfile.$OS .

DOCKER_TAG=$DOCKER_ORG/terraspace:$PACKAGE_VERSION-$OS
docker tag $DOCKER_LATEST $DOCKER_TAG

# Push OS tagged version and latest
docker push $DOCKER_TAG
docker push $DOCKER_LATEST

# disable ECR push for now, until cleanup script
# ECR=$ECR_REPO:$os
# docker tag $DOCKER_LATEST $ECR
# docker push $ECR

# Push main top-level latest
if [ "$OS" != "ubuntu" ]; then
  exit
fi

UBUNTU_TAG=$DOCKER_ORG/terraspace:ubuntu
MAIN_DOCKER_TAG=$DOCKER_ORG/terraspace:$PACKAGE_VERSION
MAIN_DOCKER_LATEST=$DOCKER_ORG/terraspace:latest

docker tag $UBUNTU_TAG $MAIN_DOCKER_LATEST
docker tag $UBUNTU_TAG $MAIN_DOCKER_TAG
docker push $MAIN_DOCKER_TAG
docker push $MAIN_DOCKER_LATEST

# disable ECR push for now, until cleanup script
# ECR=$ECR_REPO:latest
# docker tag $UBUNTU_TAG $ECR
# docker push $ECR
