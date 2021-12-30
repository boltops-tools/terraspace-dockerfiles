#!/bin/bash

set -eux

case $OS in
  alpine )
    gem search -e -r terraspace | grep terraspace | sed 's/.*(//' | sed 's/).*//' > package_version.txt
  ;;
  amzn2 | centos | fedora )
    aws s3 cp s3://$YUM_S3_BUCKET/packages/terraspace/terraspace-latest.rpm.metadata.json .
    cat terraspace-latest.rpm.metadata.json | jq -r '.version' > package_version.txt
  ;;
  debian | ubuntu)
    aws s3 cp s3://$APT_S3_BUCKET/packages/terraspace/terraspace-latest.deb.metadata.json .
    cat terraspace-latest.deb.metadata.json | jq -r '.version' > package_version.txt
  ;;
esac
