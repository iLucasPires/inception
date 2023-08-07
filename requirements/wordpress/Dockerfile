FROM debian:buster

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt install php81 php81-fpm php81-mysql php81-mbstring php81-xml php81-gd php81-curl php81-zip php81-intl php81-common php81-cli php81-opcache
