# kurento-media-server
#
# VERSION               6.1.0

FROM      ubuntu:14.04
MAINTAINER Patxi Gortázar <patxi.gortazar@gmail.com>

RUN echo "Acquire::http::Proxy \"http://ubuntu.kurento.org:3142\";" > /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get install -y wget

RUN	echo "deb http://ubuntu.kurento.org trusty-dev kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
	&& apt-get update \
	&& apt-get -y install kurento-media-server-6.0 \
	&& apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh

ENV GST_DEBUG=Kurento*:5

ENTRYPOINT ["/entrypoint.sh"]
