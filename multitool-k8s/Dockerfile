FROM nyvanga/multitool

ADD https://storage.googleapis.com/kubernetes-release/release/v1.19.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["/usr/local/bin/kubectl", "proxy"]