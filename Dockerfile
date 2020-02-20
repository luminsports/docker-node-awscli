FROM node:alpine

ENV AWSCLI_VERSION "1.18.3"

RUN apk -v --update add \
        python \
        py-pip \
        git \
        groff \
        less \
        openssh \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
