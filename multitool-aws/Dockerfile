FROM nyvanga/multitool

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
	&& unzip awscli-bundle.zip \
	&& python3 ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
	&& rm -rf awscli-bundle.zip awscli-bundle

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]