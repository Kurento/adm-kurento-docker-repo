FROM buildpack-deps:wily-scm

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

# Configure Kurento's apt proxy
RUN echo 'Acquire::http::Proxy "http://ubuntu.kurento.org:3142";' > /etc/apt/apt.conf.d/01proxy

RUN apt-get update \
  && apt-get install -y \
    git-review \
    realpath \
    unzip \
    wget \
    zip \
  && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y openjdk-8-jdk gnupg && rm -rf /var/lib/apt/lists/*
