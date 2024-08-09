#!/bin/bash

mkdir -p /var/www/html/wordpress && cd /var/www/html/wordpress
wp core download --allow-root
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --url=fheid.42.fr --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6380 --allow-root

wp config set DB_NAME $DB_NAME --allow-root
wp config set DB_USER $DB_USER --allow-root
wp config set DB_PASSWORD $DB_PASSWORD --allow-root
wp config set DB_HOST $DB_HOST --allow-root
wp config set WP_CACHE true --allow-root

wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --role=$WP_ROLE --allow-root

php-fpm8.2 -F

