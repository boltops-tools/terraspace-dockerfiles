#!/bin/bash

set -eux
for os in $(ls Dockerfile.* | sed 's/Dockerfile.//') ; do
  cody deploy terraspace-dockerfiles-$os "$@"
done
