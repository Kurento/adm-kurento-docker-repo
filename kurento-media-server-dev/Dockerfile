# kurento-media-server
#
# VERSION               6.1.0

FROM      ubuntu:14.04
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
MAINTAINER Patxi Gortázar <patxi.gortazar@gmail.com>

RUN echo "Acquire::http::Proxy \"http://proxy.kurento.org:3142\";" > /etc/apt/apt.conf.d/01proxy

RUN apt-get update \
	&& apt-get install -y \
		python \
		python-configobj \
		wget

# Install apt-transport-s3 to allow s3 backed repositories
RUN wget http://ftp.de.debian.org/debian/pool/main/a/apt-transport-s3/apt-transport-s3_1.2.1-1_all.deb \
	&& dpkg -i apt-transport-s3_1.2.1-1_all.deb \
	&& echo "AccessKeyId = $AWS_ACCESS_KEY_ID\nSecretAccessKey = $AWS_SECRET_ACCESS_KEY\nToken = ''" | tee /etc/apt/s3auth.conf

RUN	echo "deb http://ubuntuci.kurento.org trusty-dev kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& echo "deb s3://ubuntu-priv.kurento.org.s3.amazonaws.com trusty-dev kms6" | tee /etc/apt/sources.list.d/kurento-priv.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv 2F819BC0 \
	&& apt-get update \
	&& apt-get -y install \
	  kurento-media-server-6.0 \
		kms-chroma-6.0 \
		kms-crowddetector-6.0 \
		kms-face-segmentator-6.0 \
		kms-platedetector-6.0 \
		kms-pointerdetector-6.0 \
		kms-s3 \
		kms-sfu

RUN apt-get install -y \
	gdb \
  kurento-media-server-6.0-dbg \
	kms-core-6.0-dbg \
	kms-elements-6.0-dbg \
	kms-filters-6.0-dbg \
	kms-chroma-6.0-dbg \
	kms-crowddetector-6.0-dbg \
	kms-platedetector-6.0-dbg \
	kms-pointerdetector-6.0-dbg \
	kms-s3-dbg \
	kms-sfu-dbg \
	gstreamer1.5-libav-dbg \
	gstreamer1.5-plugins-bad-dbg \
	gstreamer1.5-plugins-base-dbg \
	gstreamer1.5-plugins-good-dbg \
	gstreamer1.5-plugins-ugly-dbg \
	kms-jsonrpc-1.0-dbg \
	kmsjsoncpp-dbg \
	libglib2.0-0-dbg \
	libgstreamer1.5-0-dbg \
	libnice-dbg \
	openwebrtc-gst-plugins-dbg \
	&& apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh

ENV GST_DEBUG=Kurento*:5

ENTRYPOINT ["/entrypoint.sh"]
