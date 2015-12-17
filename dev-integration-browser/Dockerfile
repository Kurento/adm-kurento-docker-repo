FROM selenium/node-chrome:2.48.2

USER root

# Configure Kurento's apt proxy
RUN echo 'Acquire::http::Proxy "http://ubuntu.kurento.org:3142";' > /etc/apt/apt.conf.d/01proxy
# HTTPS repos must connect directly as apt-cacher does not support it
RUN echo 'Acquire::http::Proxy::deb.nodesource.com "DIRECT";' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y -q \
    ca-certificates \
    curl \
    git

RUN mkdir /nodejs \
  && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
  && apt-get install -y nodejs

ENV PATH $PATH:/nodejs/bin

RUN npm -g install bower

USER seluser
