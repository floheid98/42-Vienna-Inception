#!/bin/bash

echo "STARTING HEALTHCHECK" >&2

init()
{
# mysql -u root << EOF
# CREATE DATABASE IF NOT EXISTS wp_database;
# USE wp_database;
# CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON wp_database.* TO 'wpuser'@'%';
# FLUSH PRIVILEGES;
# EOF

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
USE $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
}

check()
{
if mysqladmin ping --silent; then
    echo "STARTING SETUP SCRIPT" >&2

    init

    echo "YEEEEEEEEEES" >&2
    exit 0
else
    echo "NEIIIIIIIIIIIIN" >&2
    exit 1
fi
}

check