FROM envoyproxy/envoy-alpine:da0dc5f5dac12651f211e321f9cd7b2c70bedde9 AS envoy

# do nothing, just want pre-built envoy binaries!

FROM rabbitmq:3.7-management

# copy the pre-built binaries
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy

COPY envoy.yaml /etc/envoy.yaml

# from base rabbitmq image
# EXPOSE 4369 5671 5672 25672

# from base rabbitmq mgt image
# EXPOSE 15671 15672

# rabbitmq (5672)
EXPOSE 8080

# envoy mgt
EXPOSE 8081

# rabbitmq mgt (15672)
EXPOSE 8082

ADD ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod u+x /usr/local/bin/start_service.sh
ENTRYPOINT /usr/local/bin/start_service.sh
