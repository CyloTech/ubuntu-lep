FROM ubuntu:18.04

ENV HOME=/home/appbox \
    DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y wget \
                   curl \
                   nano \
                   git \
                   nginx \
                   php-fpm \
                   supervisor \
                   cron

RUN mkdir -p /run/php

RUN adduser -u 1000 appbox
RUN usermod -aG sudo appbox

ADD /scripts /scripts
RUN chmod -R +x /scripts

ADD /sources /sources

EXPOSE 80

ENTRYPOINT [ "/scripts/Entrypoint.sh" ]