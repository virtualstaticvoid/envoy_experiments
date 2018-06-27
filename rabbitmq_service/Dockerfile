FROM envoyproxy/envoy:latest AS envoy

# do nothing, just want pre-built envoy binaries!

FROM ruby:2.5-stretch

# copy the pre-built envoy binary
COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/envoy
COPY envoy.yaml /etc/envoy.yaml

RUN gem install bundler -v 1.16.2

RUN bundle config --global frozen 1

RUN mkdir -p /usr/service
WORKDIR /usr/service

COPY Gemfile* ./
RUN bundle install -j 4

COPY . .

EXPOSE 8080

ADD ./start_service.sh /usr/local/bin/start_service.sh
RUN chmod u+x /usr/local/bin/start_service.sh
ENTRYPOINT /usr/local/bin/start_service.sh
