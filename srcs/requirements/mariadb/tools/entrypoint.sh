#!/bin/bash

mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';

DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';

FLUSH PRIVILEGES;
EOF

exec "$@"
