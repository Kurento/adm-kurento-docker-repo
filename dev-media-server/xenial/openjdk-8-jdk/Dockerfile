FROM buildpack-deps:xenial-scm

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

# Fix for "no matching key exchange method found" error (http://www.openssh.com/legacy.html)
RUN mkdir -p /root/.ssh \
  && echo "Host somehost.example.org" >> /root/.ssh/config \
  && echo "  KexAlgorithms +diffie-hellman-group1-sha1" >> /root/.ssh/config

RUN apt-get update \
  && apt-get install -y \
    git-review \
    python \
    python-configobj \
    realpath \
    unzip \
    wget \
    zip \
  && rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y openjdk-8-jdk gnupg && rm -rf /var/lib/apt/lists/*

ENV MAVEN_VERSION 3.3.9

RUN curl -fsSL http://apache.rediris.es/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

RUN mkdir /nodejs \
  && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
  && apt-get install -y nodejs

ENV PATH $PATH:/nodejs/bin

RUN npm -g install bower

# Prepare ubuntu s3 repositories
RUN echo "deb http://ubuntuci.kurento.org xenial-dev kms6" | tee /etc/apt/sources.list.d/kurento.list \
  && apt-get update \
  && apt-get install -y --force-yes apt-transport-s3-kurento

RUN echo "deb s3://eu-west-1.s3.amazonaws.com/ubuntu-priv.kurento.org xenial-dev kms6" | tee /etc/apt/sources.list.d/kurento-priv.list

# Configure Kurento's apt proxy
RUN echo 'Acquire::http::Proxy "http://proxy.kurento.org:3142";' > /etc/apt/apt.conf.d/01proxy \
  && echo 'Acquire::HTTP::Proxy::deb.nodesource.com "DIRECT";' >> /etc/apt/apt.conf.d/01proxy
