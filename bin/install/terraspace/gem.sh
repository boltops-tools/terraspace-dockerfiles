#!/bin/sh

set -ex

if [ -z "$PACKAGE_VERSION" ] || [ "$PACKAGE_VERSION" = "" ] || [ "$PACKAGE_VERSION" = "latest" ]; then
  gem install terraspace --no-document
else
  gem install terraspace --no-document -v $PACKAGE_VERSION
fi
