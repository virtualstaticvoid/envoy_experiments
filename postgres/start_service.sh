#!/usr/bin/env bash

set -e

# use original image entrypoint + command
docker-entrypoint.sh postgres &
	envoy -c /etc/envoy.yaml --v2-config-only --service-cluster service${SERVICE_NAME}
