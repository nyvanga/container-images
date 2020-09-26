FROM debian:testing-slim

MAINTAINER Anders Nyvang

ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -g 999 iperf3 \
	&& useradd -r -u 999 -g iperf3 iperf3 \
	&& apt-get update \
	&& apt-get -y install procps iperf3 \
    && rm -rf /var/lib/apt/lists/*

USER iperf3

EXPOSE 5201

ENTRYPOINT ["iperf3", "--server"]