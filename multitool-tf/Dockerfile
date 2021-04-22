FROM nyvanga/multitool

ARG TERRAFORM_VERSION=0.14.9

RUN curl -sS "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "terraform.zip" \
 && unzip terraform.zip \
 && mv terraform /usr/local/bin/terraform \
 && rm terraform.zip