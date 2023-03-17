#!/bin/bash

set -eux
for os in $(ls Dockerfile.* | sed 's/Dockerfile.//') ; do
  cody up terraspace-dockerfiles-$os "$@" -y
done
