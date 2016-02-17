FROM ubuntu:14.04
MAINTAINER Kurento <admin@kurento.org>

RUN apt-get update \
  && apt-get install -y \
    wget

RUN wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.6-1_amd64.deb \
  && dpkg -i chefdk_0.3.6-1_amd64.deb

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    ruby1.9.3 \
    ruby1.9.1-dev

RUN apt-get update \
  && apt-get install -y \
  zlib1g-dev

RUN gem install --no-ri --no-rdoc berkshelf -v '~>3.2.3' \
  && gem install --no-ri --no-rdoc test-kitchen -v '~>1.3.1' \
  && gem install --no-ri --no-rdoc kitchen-docker -v '~>1.7.0' \
  && gem install --no-ri --no-rdoc foodcritic -v '~>4.0.0'
