FROM ubuntu:19.04
MAINTAINER me1299 "g.tiele@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN \
apt-get update \
&& apt-get install -y tzdata ssmtp fping apache2 curl openssh-client smokeping \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /var/run/smokeping

COPY root/ /
VOLUME /data /data

EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ENTRYPOINT ["/resources/entrypoint.sh"]