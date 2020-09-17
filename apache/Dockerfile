FROM httpd:2.4
MAINTAINER Anders Nyvang

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN set -eux \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget curl lynx ca-certificates \
		libmath-round-perl libgd-perl geoip-bin rrdtool vim locales procps \
	&& rm -rf /var/lib/apt/lists/*
