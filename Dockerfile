FROM ruby:2.5-alpine

LABEL maintainer="SUGIYAMA Kazuki <sugiyama.kazuki.26x@gmail.com>"

ENV APP_ROOT /app

WORKDIR $APP_ROOT

RUN apk add --update --no-cache --virtual=build-dependencies \
    build-base curl-dev linux-headers ruby-dev yaml-dev zlib-dev && \
    apk add --update --no-cache \
    libxml2-dev libxslt-dev tzdata yaml sqlite-dev && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install && \
    rm -rf ~/.gem && \
    apk del build-dependencies

COPY . $APP_ROOT

EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]
