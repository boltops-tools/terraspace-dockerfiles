#!/bin/bash

if [ -z "$CODEBUILD_CI" ]; then
  exit
fi

# DockerHub
docker login --username $DOCKER_USER --password $DOCKER_PASS
TOKEN=$(curl -s --user "$DOCKER_USER:$DOCKER_PASS" "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
echo "Current rate limit:"
curl -s --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest

# AWS ECR Public Repo
aws --version
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
