#
# Dockerfile for nginx with php
#

FROM alpine
MAINTAINER Andreas Peters <noreply@aventer.biz>

WORKDIR /var/www/html

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          gzip \
                          nginx \
                          openssl \
                          php-fpm \
                          php-openssl \
                          php-pdo_sqlite \
                          php-sqlite3 \
                          php-xml \
                          php-zlib \
                  		  php-session \
      			          php-gd \
  	    		          php-curl \
  			              php-zip \
      			          php-mbstring \
  	    		          php-soap \
      			          php-json \
		  	              bash \
    	  		          git 

RUN apk update

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

RUN mkdir -p /var/www/html/ 
RUN chown -R nobody: /var/www/html 
RUN chown -R nobody: /var/log/php81
RUN chown -R nobody: /var/lib/nginx/logs 

EXPOSE 8888

CMD /run.sh && php-fpm81 && nginx 
