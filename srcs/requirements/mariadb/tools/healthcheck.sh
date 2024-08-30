#!/bin/bash

init()
{
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
    init
    exit 0
else
    exit 1
fi
}

check