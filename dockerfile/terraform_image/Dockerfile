FROM ubuntu:24.04

# Make the version configurable
# https://github.com/hashicorp/terraform/releases
ARG TERRAFORM_VERSION=1.13.5
ARG BIN_NAME=terraform
ARG TARGETARCH
ARG VERSION
ARG GIT_BUILD_HASH
ENV USER=ubuntu
ENV GIT_BUILD_HASH=$GIT_BUILD_HASH
ENV TARGETARCH="linux-${TARGETARCH}"

LABEL org.opencontainers.image.authors="Henry Stadthagen" \
    org.opencontainers.image.source="https://github.com/henrhst/azure-agent" \
    org.opencontainers.image.description="terraform container for selfhost, for more info." \
    org.opencontainers.image.licenses="https://github.com/HenryHST/azure-agent/blob/main/LICENSE" \
    org.opencontainers.image.revision=${GIT_BUILD_HASH} \
    org.opencontainers.image.source="https://github.com/HenryHST/azure-agent" \
    org.opencontainers.image.title="terraform image" \
    org.opencontainers.image.url="https://henrystadthagen.de" \
    org.opencontainers.image.vendor="h.stadthagen@me.com" \
    org.opencontainers.image.version=${VERSION}

# Install packages available through apt
RUN apt-get update && apt-get install -y \
  bash-completion \
  curl \
  git \
  jq \
  unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Terraform as root user
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip \
  && unzip /tmp/terraform.zip -d /tmp \
  && mv /tmp/terraform /usr/local/bin/ \
  && rm -rf /tmp/* \
  && terraform version

# Switch to non-root user
USER ${USER}

WORKDIR /

# Install auto-completions for non-root user
RUN terraform -install-autocomplete

ENTRYPOINT ["/usr/local/bin/terraform"]