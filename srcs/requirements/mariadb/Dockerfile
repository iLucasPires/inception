FROM debian:bullseye

RUN apt update && apt install -y mariadb-server && \
    apt clean && rm -rf /var/lib/apt/lists/*    

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir -p /run/mysqld && \ 
    chown mysql:mysql /run/mysqld/ && \
    chmod 755 /run/mysqld/

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld", "--user=mysql"]
