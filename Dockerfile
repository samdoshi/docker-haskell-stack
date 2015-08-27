FROM buildpack-deps:latest
MAINTAINER Sam Doshi <sam@metal-fish.co.uk>

ENV STACK_VERSION 0.1.3.1

ENV STACK_DOWNLOAD_URL https://github.com/commercialhaskell/stack/releases/download/v$STACK_VERSION/stack-$STACK_VERSION-x86_64-linux.gz
ENV DEBIAN_FRONTEND noninteractive
ENV PATH $PATH:/root/.local/bin
ENV LANG C.UTF-8

RUN apt-get update -q && \
    apt-get install -qy libgmp-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /root/.local/bin && \
    wget -q -O- $STACK_DOWNLOAD_URL | gunzip > /root/.local/bin/stack && \
    chmod +x /root/.local/bin/stack

