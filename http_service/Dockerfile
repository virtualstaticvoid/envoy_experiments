FROM envoyproxy/envoy:latest AS envoy

# do nothing, just want pre-built envoy binaries!

FROM python:2-stretch

# copy the pre-built envoy binary
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy
COPY envoy.yaml /etc/envoy.yaml

ENV WEB_CONCURRENCY=4

ADD . /httpbin

RUN apk add -U ca-certificates libffi libstdc++ && \
    apk add --virtual build-deps build-base libffi-dev && \
    pip install --no-cache-dir gunicorn /httpbin && \
    apk del build-deps && \
    rm -rf /var/cache/apk/*

EXPOSE 8080

ADD ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod u+x /usr/local/bin/start_service.sh
ENTRYPOINT /usr/local/bin/start_service.sh
