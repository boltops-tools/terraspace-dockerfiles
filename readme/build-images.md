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

