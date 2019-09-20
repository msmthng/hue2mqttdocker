FROM mhart/alpine-node:4

ARG BUILD_DATE
ARG VERSION=latest

LABEL build_version="${VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="martin.hon76@gmail.com"

# allow building on x86
RUN [ "cross-build-start" ]

WORKDIR /usr/src/app

RUN git clone --depth 1 https://github.com/klutchell/hue2mqtt.js.git . \
	&& npm install

# copy src files
COPY start.sh VERSION ./

# run start script on boot
CMD ["/bin/bash", "start.sh"]

# end cross build
RUN [ "cross-build-end" ]
