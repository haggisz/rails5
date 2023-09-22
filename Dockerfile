FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential \
libpq-dev \
nodejs \
postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install
COPY . /myapp
