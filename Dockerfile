FROM node:11-alpine

MAINTAINER Nick Cook <nrcook@gmail.com>

RUN apk add --no-cache \
    build-base \
    curl \
    git \
    openssh-client \
    rsync \
    python \
    nodejs-npm

ENV VERSION 0.40
RUN mkdir -p /usr/local/src
RUN cd /usr/local/src
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz
RUN mv hugo /usr/local/bin/hugo
WORKDIR /src
RUN npm -g install \
    brunch \
    coffeescript
EXPOSE 1313

