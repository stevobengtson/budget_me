FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs exuberant-ctags vim

ENV app /myapp
RUN mkdir $app
WORKDIR $app

ADD Gemfile $app/Gemfile
ADD Gemfile.lock $app/Gemfile.lock

ENV BUNDLE_PATH /bundles
RUN bundle install
RUN gem install foreman

ADD . $app
