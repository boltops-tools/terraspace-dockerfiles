#!/bin/bash

set -eux
for os in $(ls Dockerfile.* | sed 's/Dockerfile.//') ; do
  cody start terraspace-dockerfiles-$os "$@" --no-wait -y
done
