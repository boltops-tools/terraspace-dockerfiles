#!/bin/bash

# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
# for centos
#
#     $ yum install awscli
#     No match for argument: awscli

curl -so "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
unzip -q awscliv2.zip
aws/install
aws --version

# hack codebuild installed awscli so the latest awscli is used instead
if [ -n "$CODEBUILD_CI" ]; then
  mv /root/.pyenv/shims/aws{,.1}
fi
