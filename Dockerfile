FROM envoyproxy/envoy:ad81550d5f5026c33fcfc290a4f7afdc5e754dd0

RUN apt-get -q update \
 && apt-get -q install -y curl \
 && rm -rf /var/lib/apt/lists/*

COPY envoy.yaml /etc/envoy.yaml

CMD /usr/local/bin/envoy -c /etc/envoy.yaml --v2-config-only
