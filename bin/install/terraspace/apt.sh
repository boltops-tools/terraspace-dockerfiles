#!/bin/bash

set -ex

apt-get update

if [[ -z "$PACKAGE_VERSION" || "$PACKAGE_VERSION" == "" || "$PACKAGE_VERSION" == "latest" ]]; then
  apt-get install terraspace -y
else
  # apt-get install terraspace:amd64=0.6.23-1
  apt-cache madison terraspace
  apt-get install terraspace:amd64=$PACKAGE_VERSION-1 -y
fi
