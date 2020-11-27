# Cody Files

The files in folder are used by cody to build AWS CodeBuild projects.  For more info, check out the [cody docs](https://cody.run). Here's a quick start.

## Install Tool

    gem install cody

This installs the `cody` command to manage the AWS CodeBuild project.

## Update Project

To update the CodeBuild projects:

    CODY_ENV=production cody deploy --type alpine
    CODY_ENV=production cody deploy --type amzn2
    CODY_ENV=production cody deploy --type ubuntu

## Start a Build

To start a CodeBuild build:

    CODY_ENV=production cody start --type alpine
    CODY_ENV=production cody start --type amzn2
    CODY_ENV=production cody start --type ubuntu

To specify a branch:

    CODY_ENV=production cody start demo --type ubuntu -b feature
