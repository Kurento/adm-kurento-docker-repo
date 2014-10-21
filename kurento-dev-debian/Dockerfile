# Kurento chef client
#
# VERSION               0.1.0

FROM      ubuntu:14.04
MAINTAINER Patxi Gortázar <patxi.gortazar@gmail.com>

# make sure the package repository is up to date
RUN apt-get update
RUN apt-get install -y curl wget

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Set suid to sudo
RUN chmod 4755 /usr/bin/sudo

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN add-apt-repository ppa:kurento/kurento
RUN wget -O - http://ubuntu.kurento.org/kurento.gpg.key | sudo apt-key add -
RUN apt-get update && apt-get install -y kurento-media-server

RUN /usr/sbin/sshd
