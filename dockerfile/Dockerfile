FROM ubuntu:22.04

ARG TARGETARCH
ENV TARGETARCH="linux-${TARGETARCH}"
ENV container=docker
ENV USER=agent
ENV WORKDIR=/azp
  
RUN apt update && \
    apt install ca-certificates curl -y --no-install-recommends && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc
  
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
    sudo git jq libicu70 unzip gnupg software-properties-common \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    apt clean && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*
  
WORKDIR ${WORKDIR}
  
COPY daemon.json /etc/docker/
COPY start.sh entrypoint.sh dockerd.sh buildkitd.toml job-checker.sh ${WORKDIR}/
RUN chmod +x start.sh entrypoint.sh dockerd.sh job-checker.sh
  
RUN useradd -m -u 1000 -d /home/${USER} ${USER} && \
    usermod -aG docker ${USER} && \
    chown -R ${USER}:${USER} ${WORKDIR} /home/${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}-nopasswd && \
    chmod 0440 /etc/sudoers.d/${USER}-nopasswd

USER ${USER}
VOLUME ["/var/lib/docker"]
ENTRYPOINT ["./entrypoint.sh"]
CMD ["--once"]