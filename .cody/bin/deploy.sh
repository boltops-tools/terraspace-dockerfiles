#!/bin/bash

set -eux
os=$1
shift # remove os
cody deploy terraspace-dockerfiles-$os "$@"
