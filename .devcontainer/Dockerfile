# syntax=docker/dockerfile:latest

FROM mcr.microsoft.com/vscode/devcontainers/base:debian

ARG USERNAME=vscode
ARG TARGETARCH
ARG ARCH=${TARGETARCH/arm64/aarch64}
ARG ARCH=${ARCH/amd64/x86_64}

RUN echo '/usr/bin/nu' >> /etc/shells \
    && chsh -s /usr/bin/nu ${USERNAME} \
    && mkdir -p /home/${USERNAME}/.config/nushell/ \
    && cd /tmp \
    && wget -qO - https://api.github.com/repos/nushell/nushell/releases/latest \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep ${ARCH}-unknown-linux-musl \
    | xargs -I{} wget {} \
    && tar -xzf nu* \
    && cd nu*-musl \
    && mv nu* /usr/bin \
    && chmod +x /usr/bin/nu \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.config/nushell \
    # Reset Nushell config to default
    && su -c 'config reset -w' ${USERNAME} \
    && ls /usr/bin/nu_plugin* \
    | xargs -I{} su -c 'plugin add {}' ${USERNAME} \
    && rm -rf /tmp/*

USER ${USERNAME}
