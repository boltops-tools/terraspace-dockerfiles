#!/bin/bash

set -ex

if [[ -z "$PACKAGE_VERSION" || "$PACKAGE_VERSION" == "" || "$PACKAGE_VERSION" == "latest" ]]; then
  yum install -y terraspace
else
  # yum install [package-name]-[version].[architecture]
  yum --showduplicate list terraspace
  yum install terraspace-$PACKAGE_VERSION-1.amazon2.x86_64
fi
