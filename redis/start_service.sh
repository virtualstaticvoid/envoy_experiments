#!/usr/bin/env bash

set -e

# NOTE: for production, redis >= 2.4 will compact the AOF periodically
redis-server --append-only yes &
	envoy -c /etc/envoy.yaml --v2-config-only --service-cluster service${SERVICE_NAME}
