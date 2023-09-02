FROM debian:bullseye

RUN apt update && apt install -y php-fpm php-mysql libfcgi-bin wget && \
    apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/

RUN mkdir -p /run/php && wget -O /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp && \
    wp core download --path=/var/www/html/ --allow-root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]
