FROM kurento/dev-integration:jdk-8-node-0.12

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
    zlib1g-dev

RUN pip install \
  javasphinx \
  lxml \
  javalang \
  docutils\
  sphinx==1.2.3

RUN apt-get install -y texlive-full
