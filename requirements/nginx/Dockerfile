FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y nginx openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=lpires-n.42.fr" \
    -keyout /etc/nginx/certificate.key -out /etc/nginx/certificate.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
