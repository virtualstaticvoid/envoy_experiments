FROM envoyproxy/envoy-alpine:da0dc5f5dac12651f211e321f9cd7b2c70bedde9 AS envoy

# do nothing, just want pre-built envoy binaries!

FROM redis:4.0

# copy the pre-built binaries
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy

COPY envoy.yaml /etc/envoy.yaml

# redis (6379)
EXPOSE 8080

# envoy mgt
EXPOSE 8081

ADD ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod u+x /usr/local/bin/start_service.sh
ENTRYPOINT /usr/local/bin/start_service.sh
