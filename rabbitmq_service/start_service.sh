#!/usr/bin/env bash

set -e

bundle exec rackup --server thin --host 0.0.0.0 --port 8080 &&
	envoy -c /etc/envoy.yaml --v2-config-only
