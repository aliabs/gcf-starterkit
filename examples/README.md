Source [Google Cloud Functions](https://cloud.google.com/functions/) & [Google Cloud Python Docs Samples/functions](https://github.com/GoogleCloudPlatform/python-docs-samples/tree/main/functions)

# Python Functions Frameworks Examples

## Hello World
* [`helloworld`](./helloworld/) - Deploying an Hello World function
## Concepts
* [`concepts-after-timeout`](./concepts-after-timeout/) - [Cloud Functions Execution Timeline](https://cloud.google.com/functions/docs/concepts/execution-environment#execution-timeline)
* [`concepts-filesystem`](./concepts-filesystem/) - [Cloud Functions Filesystem](https://cloud.google.com/functions/docs/concepts/execution-environment#memory-file-system)
* [`concepts-requests`](./concepts-requests/) - [Cloud Functions Networking](https://cloud.google.com/functions/docs/concepts/execution-environment#network)
* [`concepts-stateless`](./concepts-stateless/) - [Cloud Functions Statelessness](https://cloud.google.com/functions/docs/concepts/execution-environment#statelessness)
* [`concepts-compose`](./concepts-compose/) - This examples shows you how to develop a Cloud Function locally with Docker Compose, including live reloading.
* [`env_vars`](./env_vars/) - [Cloud Functions Using Environment Variables](https://cloud.google.com/functions/docs/env-var#functions_env_var-python)

## Logging and Monitering
* [`log`](./log/)
  * [Writing and Viewing Logs from Cloud Functions documentation](https://cloud.google.com/functions/docs/monitoring/logging)
  * [Viewing Cloud Functions monitored metrics documentation](https://cloud.google.com/functions/docs/monitoring/metrics)
* [`v2/audit_log`](./audit_log/)
* [`v2/http_log`](./http_log/)


## Tips
* [`tips-avoid-infinite-retries`](./tips-avoid-infinite-retries/) - Avoiding Infinite Retries sample when [Retrying Event-Driven Functions](https://cloud.google.com/functions/docs/bestpractices/retries#set_an_end_condition_to_avoid_infinite_retry_loops)
* [`tips-connection-pooling`](./tips-connection-pooling/) - Connection Pooling sample with [Optimizing Networking](https://cloud.google.com/functions/docs/bestpractices/networking#maintaining_persistent_connections)
* [`tips-lazy-globals`](./tips-lazy-globals/) - Lazy Globals sample with [Tips & Tricks for Cloud Functions](https://cloud.google.com/functions/docs/bestpractices/tips#use_global_variables_to_reuse_objects_in_future_invocations)
* [`tips-scopes`](./tips-scopes/) - Variable Scope sample with [Cloud Functions Execution Environment](https://cloud.google.com/functions/docs/concepts/execution-environment#scope)

## Deployment targets
### Cloud Function
* [`http`](./http/) - Deploying an HTTP function with the Functions Framework

### Cloud Run
* [`cloud_run_http`](./cloud_run_http/) - Deploying an HTTP function to [Cloud Run](http://cloud.google.com/run) with the Functions Framework
* [`cloud_run_event`](./cloud_run_event/) - Deploying a CloudEvent function to [Cloud Run](http://cloud.google.com/run) with the Functions Framework
* [`cloud_run_cloud_events`](cloud_run_cloud_events/) - Deploying a [CloudEvent](https://github.com/cloudevents/sdk-python) function to [Cloud Run](http://cloud.google.com/run) with the Functions Framework

## Development Tools
* [`docker-compose`](./docker-compose)
* [`skaffold`](./skaffold) - Developing multiple functions on the same host using Minikube and Skaffold

## Data Tools
* [`v2/storage`](./v2/storage) - Cloud Storage Sample using GCF v2
* [`bigquery`](./bigquery) - Bigquery Sample [TODO] ----------------------------------
* [`bigtable`](./bigtable) - Bigtable Sample
* [`firebase`](./firebase) - Firebase Sample
* [`memorystore`](./memorystore) - Memorystore Sample
* [`spanner`](./spanner) - Spanner Sample
* [`pubsub`](./pubsub) - Pubsub Sample
* [`v2/pubsub`](./v2/pubsub) - Pubsub Sample using GCF v2


## Authentication
* [`security`](./security/) - 
* [`service-account`](./service-account/) - Authentication using Service Account [TODO] ---------------------------
