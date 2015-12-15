FROM kurento/dev-media-server:trusty-jdk-8

# Configure Kurento's apt proxy
RUN echo 'Acquire::http::Proxy "http://ubuntu.kurento.org:3142";' > /etc/apt/apt.conf.d/01proxy
# HTTPS repos must connect directly as apt-cacher does not support it
RUN echo 'Acquire::http::Proxy::deb.nodesource.com "DIRECT";' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update \
  && apt-get install -y \
    git \
    graphviz \
    libxml2-dev \
    libxslt-dev \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    rsync \
    zlib1g-dev

RUN pip install \
  javasphinx \
  lxml \
  javalang \
  docutils\
  sphinx==1.2.3

RUN apt-get install -y texlive-full
