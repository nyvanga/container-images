FROM php:7-fpm-alpine
MAINTAINER Anders Nyvang

COPY php-log.conf /usr/local/etc/php-fpm.d/zz-log.conf
COPY php-install.sh /usr/local/bin/

RUN set -x \
    && deluser xfs \
    && deluser www-data \
    && addgroup -g 33 -S www-data \
    && adduser -u 33 -D -S -G www-data www-data \
    && chown www-data:www-data /var/www/html \
	&& apk add --no-cache bash tzdata wget git \
	&& php-install.sh php