github_url("https://github.com/boltops-tools/terraspace-dockerfiles")
linux_image("aws/codebuild/amazonlinux2-x86_64-standard:3.0")
environment_variables(
  OS: project_name.sub('terraspace-dockerfiles-',''), # terraspace-dockerfiles-ubuntu => ubuntu
  DOCKER_USER: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_user"),
  DOCKER_PASS: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_pass"),
  DOCKER_ORG: ssm("/terraspace-dockerfiles/#{Cody.env}/docker_org"),
)
