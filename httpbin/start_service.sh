#!/usr/bin/env bash

set -e

log_level=${1:-DEBUG}

gunicorn -b 0.0.0.0:8090 httpbin:app --log-level $log_level &
	envoy -c /etc/envoy.yaml --v2-config-only --service-cluster service${SERVICE_NAME}
