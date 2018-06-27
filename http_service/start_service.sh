#!/usr/bin/env bash

set -e

gunicorn -b 0.0.0.0:8080 httpbin:app &&
	envoy -c /etc/envoy.yaml --v2-config-only
