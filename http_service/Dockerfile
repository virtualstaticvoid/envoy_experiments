FROM envoyproxy/envoy:latest AS envoy

# do nothing, just want pre-built envoy binaries!

FROM python:2-stretch

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      supervisor \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor

# copy the pre-built envoy binary
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy

ENV WEB_CONCURRENCY=4

RUN mkdir -p /usr/service
WORKDIR /usr/service

COPY . .

RUN pip install --no-cache-dir gunicorn .

EXPOSE 8080 9080 9090

CMD ["supervisord", "--nodaemon", "--configuration", "supervisord.conf"]
