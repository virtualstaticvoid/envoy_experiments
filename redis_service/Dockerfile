FROM ruby:2.5

RUN gem install bundler -v 1.16.2

RUN bundle config --global frozen 1

RUN mkdir -p /usr/service
WORKDIR /usr/service

COPY Gemfile* ./
RUN bundle install -j 4

COPY . .

EXPOSE 8080

CMD bundle exec rackup --server thin --host 0.0.0.0 --port 8080
