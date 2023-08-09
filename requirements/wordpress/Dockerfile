FROM debian:buster-slim

RUN apt update && apt install -y php php-fpm php-mysql wordpress mariadb-client curl \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar  \
    && mv wp-cli.phar /usr/local/bin/wp \
    && mkdir /run/php \
    && wp core download --path=/var/www/html --allow-root 

COPY ./script.sh script.sh

CMD ["bash", "script.sh"]

