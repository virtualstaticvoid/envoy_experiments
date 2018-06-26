#
# assign SERVICE_NAME environment variable and mount /etc/envoy.yaml into the container
# ensure envoy.yaml defines ingress port as 9000 and admin port as 9090
#

FROM envoyproxy/envoy:latest

ENV SERVICE_NAME=Unnamed

# service port
EXPOSE 9000

# admin port
EXPOSE 9090

CMD envoy -c /etc/envoy.yaml --v2-config-only --service-cluster "service-${SERVICE_NAME}"
