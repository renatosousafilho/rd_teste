FROM ruby:2.3.0

MAINTAINER Laura Frank <laura@codeship.com>

# Used aptitude
RUN apt-get update \
  && apt-get install -y aptitude nodejs git openssl build-essential python-software-properties qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

# make the "pt_BR.UTF-8" locale so postgres will be utf-8 enabled by default
RUN aptitude update \
  && aptitude install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8


COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs=80

COPY . /var/app

WORKDIR /var/app