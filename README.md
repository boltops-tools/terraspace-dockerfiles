# Terraspace Dockerfiles

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

This repo contains Dockerfiles that include [Terraspace](https://terraspace.cloud/). You can use it try out Terraspace within an isolated Docker container.

The Docker images are published to Dockerhub daily. The images generally include the latest version of Terraspace and Terraform.

For more docs, see: [Terraspace Docker Docs](https://terraspace.cloud/docs/install/docker/)

## Usage

To run the terraspace docker container:

    docker run --rm -ti ghcr.io/boltops-tools/terraspace

The default OS is the ubuntu. To run with different OSes:

    docker run --rm -ti ghcr.io/boltops-tools/terraspace:alpine
    docker run --rm -ti ghcr.io/boltops-tools/terraspace:amzn2
    docker run --rm -ti ghcr.io/boltops-tools/terraspace:centos
    docker run --rm -ti ghcr.io/boltops-tools/terraspace:debian
    docker run --rm -ti ghcr.io/boltops-tools/terraspace:fedora
    docker run --rm -ti ghcr.io/boltops-tools/terraspace:ubuntu

## Updating Images

The Docker images are built daily. So remember to update the cached Docker images if you've pulled them before:

    docker pull ghcr.io/boltops-tools/terraspace
    docker pull ghcr.io/boltops-tools/terraspace:alpine
    docker pull ghcr.io/boltops-tools/terraspace:amzn2
    docker pull ghcr.io/boltops-tools/terraspace:centos
    docker pull ghcr.io/boltops-tools/terraspace:debian
    docker pull ghcr.io/boltops-tools/terraspace:fedora
    docker pull ghcr.io/boltops-tools/terraspace:ubuntu

## Run Terraspace in Docker Container

You probably want to test your cloud credentials. One way to do this is to mount your credentials as a volume. Example:

    docker run --rm -ti -v $HOME/.aws:/root/.aws ghcr.io/boltops-tools/terraspace:ubuntu

From there, you probably want to export your AWS_PROFILE.

    export AWS_PROFILE=tung

You can also provide an env file with the AWS_PROFILE already set, IE:

env.dev

    AWS_PROFILE=tung

Then to use the env file:

    docker run --rm -ti --env-file env.dev -v $HOME/.aws:/root/.aws ghcr.io/boltops-tools/terraspace:ubuntu

## Test Terraspace

Here are some quick-start example commands to test out terraspace.

    >>> docker run --rm -ti --env-file env.dev -v $HOME/.aws:/root/.aws ghcr.io/boltops-tools/terraspace:ubuntu
    terraspace new project infra --examples
    cd infra
    terraspace up demo -y
    terraspace down demo -y

## More Docs

* [Build Images](readme/build-images.md)
