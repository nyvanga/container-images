FROM alpine
MAINTAINER Anders Nyvang

RUN set -xe \
    && apk --no-cache add tzdata bash tinyproxy tini

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]