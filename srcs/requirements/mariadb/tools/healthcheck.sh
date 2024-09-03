#!/bin/bash

init()
{
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS grafana_db;
USE grafana_db;
CREATE TABLE IF NOT EXISTS metrics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    value FLOAT
);
INSERT INTO metrics (value, timestamp) VALUES (ROUND(RAND() * 400, 2), NOW());

CREATE DATABASE IF NOT EXISTS $DB_NAME;
USE $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
GRANT ALL PRIVILEGES ON grafana_db.* TO '$DB_USER'@'%';
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