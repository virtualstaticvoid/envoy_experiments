FROM envoyproxy/envoy:latest AS envoy

# do nothing, just want pre-built envoy binaries!

FROM ruby:2.5-stretch

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      supervisor \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor

# copy the pre-built envoy binary
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy

RUN gem install bundler -v 1.16.2
RUN bundle config --global frozen 1

RUN mkdir -p /usr/service
WORKDIR /usr/service

COPY Gemfile* ./
RUN bundle install -j 4

COPY . .

EXPOSE 8080 9080 9090

CMD ["supervisord", "--nodaemon", "--configuration", "supervisord.conf"]
