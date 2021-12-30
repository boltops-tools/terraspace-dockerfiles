#!/bin/bash

set -ex

if [[ -z "$PACKAGE_VERSION" || "$PACKAGE_VERSION" == "" || "$PACKAGE_VERSION" == "latest" ]]; then
  dnf install -y terraspace
else
  # dnf install terraspace-0.6.23-1.amazon2 -y
  dnf --showduplicates list terraspace
  dnf install terraspace-$PACKAGE_VERSION-1.amazon2 -y
fi
