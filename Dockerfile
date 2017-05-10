FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
COPY Gemfile.lock /
COPY Gemfile /
RUN gem install bundler
RUN bundle install
COPY config.ru /config.ru
CMD ["rackup", "--port", "80", "--host", "0.0.0.0"]
EXPOSE 80
