FROM debian:bullseye

RUN apt update && apt install -y nginx openssl && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42 Sao Paulo/OU=42SP/CN=www.42sp.org.br/emailAddress=navemae@42sp.org.br" \
    -keyout /etc/nginx/certificate.key -out /etc/nginx/certificate.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
