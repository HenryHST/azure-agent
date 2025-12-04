FROM ghcr.io/opentofu/opentofu:minimal AS tofu

FROM ubuntu:24.04

# Copy the tofu binary
COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.authors="Henry Stadthagen" \
    org.opencontainers.image.description="azure build agent for selfhost,  for more info." \
    org.opencontainers.image.licenses="https://github.com/HenryHST/azure-agent/blob/main/LICENSE" \
    org.opencontainers.image.revision=${GIT_BUILD_HASH} \
    org.opencontainers.image.source="https://github.com/HenryHST/azure-agent" \
    org.opencontainers.image.title="azure build agent image" \
    org.opencontainers.image.url="https://henrystadthagen.de" \
    org.opencontainers.image.vendor="h.stadthagen@me.com" \
    org.opencontainers.image.version=${VERSION}

WORKDIR /workspace
