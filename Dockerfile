FROM node:alpine

ENV AWSCLI_VERSION "1.18.3"

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN apk -v --update add \
        python3 \
        git \
        groff \
        openssh \
        mailcap \
        && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip awscli==$AWSCLI_VERSION && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
