FROM alpine
MAINTAINER Anders Nyvang

ENV TZ=Europe/Copenhagen

RUN set -x \
    && apk add --no-cache coreutils tzdata bash bash-doc bash-completion wget curl lynx geoip \
      bind-tools tcptraceroute ca-certificates perl perl-math-round perl-gd python3 py3-pip \
      ethtool git iperf3 iproute2 iputils jq lftp mtr netcat-openbsd net-tools openssl \
      perl-net-telnet procps rsync socat tcpdump tshark nmap openssh-client  \
	  postgresql-client mysql-client \
    && rm -rf /tmp/* /var/cache/apk/* \
    && pip3 install --no-cache-dir docopt speedtest-cli

COPY bashrc.sh /root/.bashrc

ENTRYPOINT ["/bin/bash"]