# Starter Kit for Google Cloud Functions

Starter project template for running a functions-based application on
Google Cloud Platform hosted on Cloud Functions or Cloud Run

## Scope of this starter kit

The scope of this starter kit is fairly small, help to ensure that your functions work both locally and in a test environment on Google Cloud,
to avoid bloating the code and keeping the list of opinionated choices fairly minimal. And utilize GCP services for having a fast production environment deployment.

### In scope and already implemented

This starter kit includes the following:

- Production-ready GCF configuration
- Continuous Integration (CI) workflow via Cloud Build for Cloud Function
- Continuous deployment (CD) workflow via Cloud Build for Cloud Function
- Examples cover GCF features
- Tests cover GCF use cases

### Not yet implemented

The starter kit does not yet include the following (PRs are welcome):

- Continuous Integration (CI) workflow via Cloud Build for CLoud Run
- Continuous deployment (CD) workflow via Cloud Build for Cloud Run


## Technologies

- [Cloud Source Repositories](https://cloud.google.com/source-repositories/docs/features) - Cloud Source Repositories are fully featured, private Git repositories hosted on Google Cloud
- [Cloud Build](https://cloud.google.com/build/docs/overview) - Build, test, and deploy on Google Cloud serverless CI/CD platform.
- [Cloud Function](https://cloud.google.com/functions) - Run your code in the cloud with no servers or containers to manage with our scalable, pay-as-you-go functions as a service (FaaS) product.
- [Cloud Run](https://cloud.google.com/run) - Build and deploy scalable containerized apps written in any language (including Go, Python, Java, Node.js, .NET, and Ruby) on a fully managed platform.
- [Docker](https://www.docker.com) - Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers.

## Development Setup Requirements

- Python 3.4 or later
- MacOS, and Linux development environments are supported


## Development Setup Instructions
### See [Functions Framework](Functions_Framework.md)

## Running the Development Server 
### See [Functions Framework](Functions_Framework.md)

## Deploying to Google Cloud Functions 
### See [Functions Framework](Functions_Framework.md)

## CI/CD - Google Cloud Setup Instructions on Local machine
1. Enable Cloud Functions API
2. Download and install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/)
3. If on Windows, run the "Google Cloud SDK Shell" application (keep option selected during SDK install)
4. Type `gcloud init` in a terminal or in the Cloud SDK Shell (or keep option selected during install)
5. Log in via `gcloud auth login` in the Cloud SDK Shell if necessary
6. Set the active project (created in step 1) via `gcloud config set project PROJECT_ID`
7. If on Windows, install the App Engine components via `gcloud components install app-engine-python`

### `gcloud configurations`

```bash
gcloud config configurations list
```
### Create dev configuration
```bash
gcloud config configurations create dev
gcloud config set project example-dev-337717
gcloud config set account tung@boltops.com
gcloud config set compute/region us-centrall
gcloud config set compute/zone us-centrall-b
```
### Create prod configuration
```bash
gcloud config configurations create prod
gcloud config set project example-prod-337717
gcloud config set account tung@boltops.com
gcloud config set compute/region us-centrall
gcloud config set compute/zone us-centrall-b
```
### Activate different configurations
```bash
gcloud config configurations activate dev
gcloud config configurations activate prod
```
### Config Files Themselves
```bash
cat ~/.config/gcloud/active_config
cat ~/.config/gcloud/configurations/config_dev
cat ~/.config/gcloud/configurations/config_prod
```
## Test
```bash
gcloud docs compute instances list
```

See the platform-specific Quickstart guides at https://cloud.google.com/sdk/docs/quickstarts


# CI/CD - Repo sync for Cloud Functions

## Cloning a repository  
This topic describes how to clone the contents of a repository from Cloud Source Repositories to your local machine using the gcloud CLI

1. Ensure that the gcloud CLI is installed on your local system.
In a terminal window, provide your authentication credentials:
```bash
gcloud init 
```
2. Clone your repository:
```bash
gcloud source repos clone [REPO_NAME] --project=[PROJECT_NAME]
```
Where:
[REPO_NAME] is the name of your repository.
[PROJECT_NAME] is the name of your Google Cloud project.
For example:
```bash
gcloud source repos clone test-repo --project=example-project
```

## Push a local repository into Cloud Source Repositories
1. Ensure that the [gcloud CLI is installed](https://cloud.google.com/source-repositories/docs/authentication#authenticate-using-the-cloud-sdk) on your machine and setup the config using
```bash
gcloud init
```
2. Open a terminal window.
3. If you're using Windows, enter the following command:
```bash
gcloud init && git config credential.helper gcloud.cmd
```
If you're using Linux or macOS, enter the following command:
```bash
gcloud init && git config credential.helper gcloud.sh
```
If you didnt create `gcloud config` file use this comment instead for Linux or macOS
```bash
gcloud init && git config --global credential.https://source.developers.google.com.helper gcloud.sh

```
4. Create the repository in Cloud Source Repositories:
```bash
gcloud source repos create [REPO_NAME]
gcloud source repos create gcf-starterkit
```

4. Add your local repository as a remote:
```bash
git remote add google https://source.developers.google.com/p/[PROJECT_NAME]/r/[REPO_NAME]
git remote add google https://source.developers.google.com/p/atn-web-app-dev/r/gcf-starterkit
```
Where:
[PROJECT_NAME] is the name of your Google Cloud project.
[REPO_NAME] is the name of your repository.
5. Push your code to Cloud Source Repositories:
```bash
git push --all google
```

## Use the repository as a remote
#### Google Cloud repositories are fully featured Git repositories. You can use the standard set of Git commands to interact with these repositories, including push, pull, clone, and log.

#### Push to a Google Cloud repository
To push from your local Git repository to a Google Cloud repository, enter the following command:
```bash
git push google master
```
#### Pull from a Google Cloud repository
To pull from a Google Cloud repository to your local Git repository, enter the following command:
```bash
git pull google master
```

#### View the commit history of a Google Cloud repository
To view the commit history, enter the following command:
```bash
git log google/master
```
### Use the repository with branches
#### Whenever working on features or changing code make sure you are not on the master (main) and create a branch
#### Create a new branch
To create a new branch, enter the following commend (New branch will not change the status)
```bash
git branch BRANCH_NAME
```
#### Change Status
To switch the branch, use the following commend (Make sure you committed any pending changes)
```bash
git commit -m 'commit msg'
git checkout BRANCH_NAME
```
#### Delete Branch
```bash
git push google --delete BRANCH_NAME
```
### Commit Messages Guide
```
build: Changes that affect the build system or external dependencies (example scopes: app.yaml, npm, Docker)
ci: Changes to our CI configuration files and scripts 
cd: Changes to our CD configuration files and scripts
docs: Documentation only changes
feat: A new feature
fix: A bug fix
perf: A code change that improves performance
refactor: A code change that neither fixes a bug nor adds a feature
style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
test: Adding missing tests or correcting existing tests
```
#### Merge branch
To merge branch, while you are in master use the following commend
```bash
git merge BRANCH_NAME
```
# CD using Cloud Build
Grant the Cloud Functions Developer role to the Cloud Build service account:
1. Open the [Cloud Build Settings](https://console.cloud.google.com/cloud-build/settings) page
2. Set the status of the Cloud Functions Developer role to Enabled.
3. Create a build file for each functions sub-directories in [`src`](./src/), 
to only make that sub-directory to deploy use `cloudbuild.yaml` inside each sub-directory.
To create a `cloudbuild.yaml`that deploy:
```bash
steps:
- name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
  args:
  - gcloud
  - functions
  - deploy
  - FUNCTION_NAME
  - --region=FUNCTION_REGION
  - --source=.
  - --trigger-http
  - --runtime=RUNTIME
```
Replace the placeholder values in the config file above with the following:

* FUNCTION_NAME is the name of the Cloud Functions you are deploying. If you're updating an existing function, this value must match the name of the function you're updating.

* FUNCTION_REGION is the region to which you're deploying Cloud Functions. 

* For a list of supported regions, see [Cloud Functions locations](https://cloud.google.com/functions/docs/locations).

* `--trigger-http` is the trigger type for this function, in this case an HTTP request (webhook).
* RUNTIME is the runtime in which to run the function.

Check [`examples/ci_cd/cloudbuild.yaml`](examples/ci_cd/cloudbuild.yaml) for complete reference

4. Start the build using the config file created in the previous step:
```bash
  gcloud builds submit --region=REGION --config CONFIG_FILE_PATH SOURCE_DIRECTORY
```
Replace the placeholder values in the config file above with the following:

CONFIG_FILE_PATH is the path to the build config file.
SOURCE_DIRECTORY is the path or URL to the source code.
REGION is one of the supported build regions.
If you don't specify a CONFIG_FILE_PATH and SOURCE_DIRECTORY in the gcloud builds submit command, Cloud Build assumes that the config file and the source code are in the current working directory.

# CI using Cloud Build
Use [Cloud Build Triggers](https://console.cloud.google.com/cloud-build/triggers)
To create a trigger if your source code is in Cloud Source Repositories:
create `trigger.yaml` file
```bash
# trigger.yaml
filename: BUILD_CONFIG_FILE
includedFiles:
- FUNCTION_SUBDIRECTORY
name: NAME
triggerTemplate:
  branchName: BRANCH_PATTERN
  projectId: PROJECT_ID
  repoName: REPO_NAME
```
Where:
- NAME is the name of your trigger.
- FUNCTION_SUBDIRECTORY is the pattern for files changed
- REPO_NAME is the name of your repository.
- BRANCH_PATTERN is the branch name in your repository to invoke the build on.
- TAG_PATTERN is the tag name in your repository to invoke the build on.
- BUILD_CONFIG_FILE is the path to your build configuration file.
- SERVICE_ACCOUNT is the email associated with your service account. If you don't include this flag, the default Cloud Build service account is used.
-  --require-approval is _Optional_ the flag to include to configure your trigger to require approval.

For a complete list of flags, see the [`gcloud`reference for how to create triggers for Cloud Source Repositories](https://cloud.google.com/sdk/gcloud/reference/beta/builds/triggers/create/cloud-source-repositories).
and run
```bash
gcloud builds triggers import --source=src/FUNCTION_SUBDIRECTORY/trigger.yaml
```

#### See [Resubmitting a build for approval, Update, Disable, Delete](https://cloud.google.com/build/docs/automating-builds/create-manage-triggers#resubmitting_a_build_for_approval)

