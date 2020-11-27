github_url("https://github.com/boltops-tools/terraspace-dockerfiles")
linux_image("aws/codebuild/standard:4.0")
environment_variables(
  DOCKER_USER: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_user"),
  DOCKER_PASS: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_pass"),
  DOCKER_ORG: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_org"),
)
