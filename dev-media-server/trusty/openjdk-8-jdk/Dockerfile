FROM buildpack-deps:trusty-scm

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

# Configure Kurento's apt proxy
RUN echo 'Acquire::http::Proxy "http://ubuntu.kurento.org:3142";' > /etc/apt/apt.conf.d/01proxy \
  && echo 'Acquire::HTTP::Proxy::deb.nodesource.com "DIRECT";' >> /etc/apt/apt.conf.d/01proxy

ENV LANG C.UTF-8

RUN gpg --keyserver keyserver.ubuntu.com --recv EB9B1D8886F44E2A \
	&& gpg --export --armor EB9B1D8886F44E2A | sudo apt-key add - \
	&& echo 'deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main ' > /etc/apt/sources.list.d/openjdk-8.list \
  && apt-get update \
	&& apt-get install -y --force-yes openjdk-8-jdk
