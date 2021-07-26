FROM ruby:2.6.3

RUN apt-get update && apt-get install -y libpq-dev libxml2-dev

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler
RUN bundle install

COPY . .

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
