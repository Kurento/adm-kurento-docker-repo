# Kurento chef client
#
# VERSION               0.1.0

FROM      i686/ubuntu:14.04
MAINTAINER Alin CALINCIUC<alin.calinciuc@gmail.com>

# make sure the package repository is up to date and install supervisor
RUN apt-get update -y
RUN apt-get install -y curl supervisor

RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash

ADD chef-validator.pem /etc/chef/chef-validator.pem
ADD client.rb /etc/chef/client.rb
ADD client.pem /etc/chef/client.pem

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Set suid to sudo
RUN chmod 4755 /usr/bin/sudo

# SSHd service daemon
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# Add password nubomedia for user root 
RUN echo 'root:nubomedia' |chpasswd

EXPOSE 22

# Install dev-debian
RUN chef-client
