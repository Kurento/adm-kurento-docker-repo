# Kurento chef client
#
# VERSION               0.1.0

FROM      i686/ubuntu:14.04
MAINTAINER Alin CALINCIUC<alin.calinciuc@gmail.com>

# make sure the package repository is up to date and install supervisor
RUN apt-get update -y
RUN apt-get install -y curl supervisor sudo

RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash

ADD chef-validator.pem /etc/chef/chef-validator.pem
ADD client.rb /etc/chef/client.rb
ADD client.pem /etc/chef/client.pem

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# Install dev-debian
RUN chef-client

RUN ln -s /sbin/initctl.distrib /sbin/initctl