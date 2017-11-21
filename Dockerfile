FROM alpine:latest

MAINTAINER Zonesan <chaizs@asiainfo.com>


ADD . /

WORKDIR /prod

# Install nginx & node
# Install Bower
# Install node & bower depends
# Set bower root allow

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
RUN apk add --update nodejs git nodejs-npm gcc autoconf automake && \
    npm install -g bower && \
    echo '{ "allow_root": true }' > /root/.bowerrc && \
    git config --global url."https://".insteadOf git:// && \
    npm install && \
    bower install && \
    apk del gcc autoconf automake && \
    rm -rf /var/cache/apk/* /tmp/*
