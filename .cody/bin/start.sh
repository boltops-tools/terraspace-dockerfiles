#!/bin/bash

set -eux
os=$1
shift # remove os
cody start terraspace-dockerfiles-$os "$@" -y
