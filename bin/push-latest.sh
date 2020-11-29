#!/bin/bash

set -eu
os=$1
if [ "$os" != "ubuntu" ]; then
  exit
fi

set -x
docker tag $DOCKER_ORG/terraspace:ubuntu $DOCKER_ORG/terraspace:latest
docker push $DOCKER_ORG/terraspace:latest
