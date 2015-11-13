# dev-integration image to build Java & JS kurento projects
#
# VERSION	6.0.0

FROM	maven:3.3.3-jdk-8
MAINTAINER Patxi Gortázar <patxi.gortazar@gmail.com>

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y -q \
    build-essential \
    ca-certificates \
    curl \
    git \
    mediainfo \
    python

RUN mkdir /nodejs \
  && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
  && apt-get install -y nodejs

ENV PATH $PATH:/nodejs/bin

RUN npm -g install bower
