FROM debian:bullseye-slim

RUN apt update && apt install -y \
    php7.4-fpm php7.4-mysql mariadb-client libfcgi-bin wget && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/ /run/php && \
    chown www-data:www-data /var/www/html/ /run/php && \
    chmod 755 /run/php && \
    wget -O /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp && \
    wp core download --path=/var/www/html/ --allow-root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/html/wp-config.php

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]
