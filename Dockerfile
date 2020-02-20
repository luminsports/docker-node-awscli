FROM node:alpine

ENV AWSCLI_VERSION "1.18.3"
RUN apk -v --no-cache --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION} && \
    apk -v --purge del py-pip && \
    rm -rf /var/cache/apk/*

