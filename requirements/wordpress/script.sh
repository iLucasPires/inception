#!/bin/bash


if ! wp core is-installed --path=/var/www/ --allow-root; then
    wp core config \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost=$DB_HOST \
        --dbprefix='wp_' \
        --dbcharset="utf8" \
        --path=/var/www/html \
        --allow-root

    wp core install \
        --url=$DOMAIN_NAME \
        --title=$TITLE \
        --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASS \
        --admin_email=$ADMIN_EMAIL \
        --path=/var/www/html \
        --allow-root

    wp user create ${SUBSCRIBER_USER}  ${SUBSCRIBER_EMAIL} --role=subscriber --user_pass=${SUBSCRIBER_PASS} 

fi
php-fpm7.3 --nodaemonize
