FROM envoyproxy/envoy:latest

# service port
EXPOSE 9000

# admin port
EXPOSE 9090

CMD envoy -c /etc/envoy.yaml --v2-config-only
