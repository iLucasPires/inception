FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y mariadb-server  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/entrypoint.sh /entrypoint.sh

EXPOSE 3306

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
CMD ["mysqld_safe"]
