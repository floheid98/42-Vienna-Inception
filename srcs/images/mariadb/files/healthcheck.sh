#!/bin/bash

echo "STARTING HEALTHCHECK" >&2

init()
{
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS wp_database;
USE wp_database;
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wp_database.* TO 'wpuser'@'%';
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