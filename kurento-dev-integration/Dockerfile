# Kurento chef client
#
# VERSION               0.1.0

FROM      ubuntu:14.04
MAINTAINER Patxi Gortázar <patxi.gortazar@gmail.com>

# make sure the package repository is up to date
RUN apt-get update
RUN apt-get install -y curl

RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash

ADD chef-validator.pem /etc/chef/chef-validator.pem
ADD client.rb /etc/chef/client.rb
ADD client.pem /etc/chef/client.pem

RUN chef-client



