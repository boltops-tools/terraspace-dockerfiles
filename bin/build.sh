#!/bin/bash

set -eux

bin/login.sh

os=$1
docker build -t $DOCKER_ORG/terraspace:$os -f Dockerfile.$os .
