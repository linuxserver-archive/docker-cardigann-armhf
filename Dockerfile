FROM lsiobase/alpine.armhf
MAINTAINER sparklyballs

# environment settings
ENV CONFIG_DIR="/config"

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages and update ca-certificates
 apk add --no-cache \
	ca-certificates \
	libc6-compat \
	wget && \
 update ca-certificates && \

# install cardigan
 wget -O \
 /tmp/cardigann-src.tgz \
	https://bin.equinox.io/c/3u8U4iwUn6o/cardigann-stable-linux-arm.tgz && \
 tar xf \
 /tmp/cardigann-src.tgz -C \
	/tmp/ && \
 install -Dm755 \
	/tmp/cardigann \
	/usr/bin/cardigann && \

# cleanup
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5060
VOLUME /config
