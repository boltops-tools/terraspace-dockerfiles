#!/bin/bash

set -eux

os=$1

bin/login.sh

docker push $DOCKER_ORG/terraspace:$os
