# Kurento media server build file
#
# VERSION               0.2.0

FROM       phusion/baseimage:0.9.15
MAINTAINER Kurento <kurento@googlegroups.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# make sure the package repository is up to date
RUN apt-get update && apt-get install -y wget

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://ppa.launchpad.net/kurento/kurento/ubuntu trusty main\ndeb-src http://ppa.launchpad.net/kurento/kurento/ubuntu trusty main" > /etc/apt/sources.list.d/kurento.list
RUN echo "deb http://ubuntu.kurento.org trusty main" > /etc/apt/sources.list.d/kurento-dev.list

RUN wget -O - http://ubuntu.kurento.org/kurento.gpg.key | sudo apt-key add -
RUN apt-get update && apt-get install -y --force-yes kurento-media-server

### Start kurento-media-server:
RUN mkdir -p /var/log/kurento-media-server
RUN mkdir /etc/service/kurento-media-server
ADD kurento-media-server.sh /etc/service/kurento-media-server/run

EXPOSE 8888

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*