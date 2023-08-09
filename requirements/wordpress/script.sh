#!/bin/bash
wp core config \
    --dbname=${DB_NAME} \
    --dbuser=${DB_USER} \
    --dbpass=${DB_PASS} \
    --dbhost=${DB_HOST} \
    --dbprefix='wp_' \
    --dbcharset="utf8"

wp core install \
    --url=${DOMAIN_NAME} \
    --title=${TITLE} \
    --admin_user=${ADMIN_USER} \
    --admin_password=${ADMIN_PASS} \
    --admin_email=${ADMIN_EMAIL} \
    --skip-email

php-fpm7.3" --nodaemonize
