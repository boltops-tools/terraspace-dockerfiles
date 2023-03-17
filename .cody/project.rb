github("https://github.com/boltops-tools/terraspace-dockerfiles")
image("aws/codebuild/amazonlinux2-x86_64-standard:4.0")
env_vars(
  OS: project_name.sub('terraspace-dockerfiles-',''), # terraspace-dockerfiles-ubuntu => ubuntu
  # For rate-limit
  DOCKER_USER: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_user"),
  DOCKER_PASS: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_pass"),
  DOCKER_ORG: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_org"),
  # github container registry
  GITHUB_USER: ssm("/terraspace-dockerfiles/#{Cody.env}/github_user"),
  GITHUB_TOKEN: ssm("/terraspace-dockerfiles/#{Cody.env}/github_token"),
  # ecr not use anymore
  ECR_REPO: ssm("/terraspace-dockerfiles/#{Cody.env}/ecr_repo"),
  CODY_ENV: Cody.env,
  # for bin/write_package_version.sh
  APT_S3_BUCKET: ssm("/terraspace-dockerfiles/#{Cody.env}/apt_s3_bucket"),
  YUM_S3_BUCKET: ssm("/terraspace-dockerfiles/#{Cody.env}/yum_s3_bucket"),
)
