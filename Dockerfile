FROM ubuntu:latest
MAINTAINER Andreas Peters <ap@aventer.biz>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  bzip2 \
  libcurl4-openssl-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg-dev \
  libldap2-dev \
  libmcrypt-dev \
  libmemcached-dev \
  libpng12-dev \
  libpq-dev \
  libxml2-dev \
  nginx \
  tzdata \
  redis-server \
  curl \
  git \
  daemontools \
  php-fpm \
  php-redis \
  php-dev \
  php-apcu \
  php-memcached \
  php-redis \
  php-mysql \
  php-gd \
  php-curl \
  php-zip \
  php-mbstring \
  php-opcache \
  unzip \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -y upgrade

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
COPY opcache.ini /etc/php/7.0/mods-available/opcache.ini
COPY apcu.ini /etc/php/7.0/mods-available/apcu.ini
COPY redis.conf /etc/redis.conf
COPY run.sh /usr/local/bin/run.sh
COPY s6.d /etc/s6.d
RUN chmod +x /usr/local/bin/* /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*
RUN chown -R www-data: /var/www/html/

VOLUME /var/www/html/

EXPOSE 8888

CMD ["run.sh"]
