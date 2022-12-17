# https://cloud.google.com/sdk/gcloud/reference/beta/builds/triggers/create/cloud-source-repositories
# https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values
# https://wlyn.ch/posts/gcb-trigger-config-files/
# https://cloud.google.com/sdk/gcloud/reference/builds/triggers

# gcloud beta builds triggers create cloud-source-repositories
# (--trigger-config=PATH     |
# [--repo=REPO
# (--branch-pattern=REGEX |
# --tag-pattern=REGEX)
# (--build-config=PATH |
# --inline-config=PATH |
# [--dockerfile=DOCKERFILE :
# --dockerfile-dir=DOCKERFILE_DIR; default="/"
# --dockerfile-image=DOCKERFILE_IMAGE]) :
# --description=DESCRIPTION
# --ignored-files=[GLOB,…]
# --included-files=[GLOB,…]
# --name=NAME
# --region=REGION
# --require-approval
# --service-account=SERVICE_ACCOUNT
# --substitutions=[KEY=VALUE,…]])
# [GCLOUD_WIDE_FLAG …]

# create trigger file and use builds triggers create cloud-source-repositories --trigger-config=src/helloworld/trigger.yaml
filename: src/helloworld/cloudbuild.yaml
includedFiles:
- src/helloworld/**
name: test-tr
triggerTemplate:
  branchName: ^master$
  projectId: atn-web-app-dev
  repoName: gcf-starterkit


gcloud builds triggers import --source=src/helloworld/tr

