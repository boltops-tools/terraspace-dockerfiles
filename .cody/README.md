# Cody Files

The files in folder are used by cody to build AWS CodeBuild projects.  For more info, check out the [cody docs](https://cody.run). Here's a quick start.

## Install Tool

    gem install cody

This installs the `cody` command to manage the AWS CodeBuild project.

## Update Project

To update the CodeBuild projects:

    CODY_ENV=production cody deploy terraspace-dockerfiles-alpine
    CODY_ENV=production cody deploy terraspace-dockerfiles-amzn2
    CODY_ENV=production cody deploy terraspace-dockerfiles-ubuntu

Wrapper script:

    CODY_ENV=production .cody/bin/deploy.sh alpine
    CODY_ENV=production .cody/bin/deploy.sh amzn2
    CODY_ENV=production .cody/bin/deploy.sh centos
    CODY_ENV=production .cody/bin/deploy.sh debian
    CODY_ENV=production .cody/bin/deploy.sh fedora
    CODY_ENV=production .cody/bin/deploy.sh ubuntu

## Start a Build

To start a CodeBuild build:

    CODY_ENV=production cody start terraspace-dockerfiles-alpine
    CODY_ENV=production cody start terraspace-dockerfiles-amzn2
    CODY_ENV=production cody start terraspace-dockerfiles-ubuntu

Wrapper script:

    CODY_ENV=production .cody/bin/start.sh alpine
    CODY_ENV=production .cody/bin/start.sh amzn2
    CODY_ENV=production .cody/bin/start.sh centos
    CODY_ENV=production .cody/bin/start.sh debian
    CODY_ENV=production .cody/bin/start.sh fedora
    CODY_ENV=production .cody/bin/start.sh ubuntu

To specify a branch:

    CODY_ENV=production cody start demo terraspace-dockerfiles-ubuntu -b feature
    CODY_ENV=production .cody/bin/start.sh ubuntu -b feature
