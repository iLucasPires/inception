FROM debian:buster-slim

RUN apt update && apt install -y \
    php php-fpm php-mysql wordpress mariadb-client wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --allow-root --path=/var/www/html/ \
    && mkdir /run/php 

WORKDIR /var/www/html/

COPY ./conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf
COPY ./tools/entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["bash", "/entrypoint.sh"]
