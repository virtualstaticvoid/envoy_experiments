FROM envoyproxy/envoy:latest

# service & admin port
EXPOSE 9000 9090

CMD envoy -c /etc/envoy.yaml --v2-config-only
