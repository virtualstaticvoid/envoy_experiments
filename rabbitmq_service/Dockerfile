FROM ruby:2.5

RUN gem install bundler -v 11.16.2

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .
RUN bundle install -j 4

EXPOSE 8080

CMD bundle exec rackup --server thin --host 0.0.0.0 --port 8080

