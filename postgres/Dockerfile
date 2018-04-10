FROM envoyproxy/envoy:da0dc5f5dac12651f211e321f9cd7b2c70bedde9 AS envoy

# do nothing, just want pre-built envoy binaries!

FROM postgres:9.6

# copy the pre-built envoy binary
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy

COPY envoy.yaml /etc/envoy.yaml

# postgres (5432)
EXPOSE 8080

# envoy mgt
EXPOSE 8081

ADD ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod u+x /usr/local/bin/start_service.sh
ENTRYPOINT /usr/local/bin/start_service.sh
