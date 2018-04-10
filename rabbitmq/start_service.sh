#!/usr/bin/env bash

set -e

# use original image entrypoint + envoy sidecar
docker-entrypoint.sh rabbitmq-server &
	envoy -c /etc/envoy.yaml --v2-config-only --service-cluster service${SERVICE_NAME}
