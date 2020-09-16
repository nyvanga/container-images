FROM alpine:3.11

# https://www.speedtest.net/apps/cli#download
ENV SPEEDTEST_VERSION 1.0.0

RUN set -eux \
	&& wget -q -O speedtest.tgz "https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-$SPEEDTEST_VERSION-x86_64-linux.tgz" \
	&& tar -xvf speedtest.tgz -C /usr/local/bin speedtest \
	&& rm speedtest.tgz

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh"]