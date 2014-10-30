# Kurento chef client
#
# VERSION               0.1.0

FROM      i686/ubuntu:14.04
MAINTAINER Kurento <kurento@googlegroups.com>

# make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y wget

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://ppa.launchpad.net/kurento/kurento/ubuntu trusty main\ndeb-src http://ppa.launchpad.net/kurento/kurento/ubuntu trusty main" > /etc/apt/sources.list.d/kurento.list
RUN echo "deb http://ubuntu.kurento.org trusty main" | tee -a /etc/apt/sources.list > /dev/null

RUN wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add -
RUN apt-get update && apt-get install -y --force-yes kurento-media-server

EXPOSE 8888

CMD kurento-media-server