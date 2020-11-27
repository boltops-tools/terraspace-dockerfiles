## Build Docker Image

To build:

    $ docker build -t boltops/terraspace:ubuntu -f Dockerfile.ubuntu .
    $ docker run --rm -ti boltops/terraspace:ubuntu
    # terraspace version
    0.5.1
    #

## Wrapper Build Scripts

There are also the wrapper build and push scripts. Here are examples to build and push different OS Docker images.

    bin/build.sh ubuntu
    bin/push.sh ubuntu

    bin/build.sh amzn2
    bin/push.sh amzn2

    bin/build.sh alpine
    bin/push.sh alpine

## Run Terraspace in Docker Container

You probably want to test terraspace with your credentials. Here's how you mount your AWS credentials.

    docker run --rm -ti -v $HOME/.aws:/root/.aws boltops/terraspace:ubuntu

From there you probably want to export your profile

    export AWS_PROFILE=tung

You can also provide an env file, IE:

env.dev

    AWS_PROFILE=tung

Then use the env file

    docker run --rm -ti --env-file env.dev -v $HOME/.aws:/root/.aws boltops/terraspace:ubuntu

## Test Terraspace

    >>> docker run --rm -ti --env-file env.dev -v $HOME/.aws:/root/.aws boltops/terraspace:ubuntu
    terraspace new project infra --examples
    cd infra
    terraspace up demo -y
    terraspace down demo -y

