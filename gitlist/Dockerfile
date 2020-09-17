FROM php:7-alpine
MAINTAINER Anders Nyvang

ENV GITLIST_VERSION=1.0.2

RUN set -x \
    && deluser xfs \
    && deluser www-data \
    && addgroup -g 33 -S www-data \
    && adduser -u 33 -D -S -G www-data www-data \
    && chown www-data:www-data /var/www/html \
    && apk add --no-cache bash tzdata git

STOPSIGNAL SIGINT

WORKDIR /var/www/html

RUN	curl -o gitlist.tar.gz -SL https://github.com/klaussilveira/gitlist/releases/download/${GITLIST_VERSION}/gitlist-${GITLIST_VERSION}.tar.gz \
	&& tar -xzf gitlist.tar.gz \
	&& rm -f gitlist.tar.gz \
	&& cd gitlist \
	&& mkdir cache \
	&& chmod 777 cache \
	&& mv config.ini-example config.ini \
	&& sed -i "s/repositories\[\] = '\/home\/git\/repositories\/'/repositories\[\] = '\/repos\/'/" config.ini \
	&& sed -i "s/; timezone = UTC/timezone = CET/" config.ini \
	&& sed -i "s/; format = 'd\/m\/Y H:i:s'/format = 'Y.m.d H:i:s'/" config.ini

USER www-data

EXPOSE 8080

CMD [ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]