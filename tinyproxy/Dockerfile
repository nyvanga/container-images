FROM alpine
MAINTAINER Anders Nyvang

# Install packages
RUN set -xe \
    && apk --no-cache add tzdata bash tinyproxy tini

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Entrypoint
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/tinyproxy", "-d"]
