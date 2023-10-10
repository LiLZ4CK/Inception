#!/bin/bash

if [ ! -f "/var/www/wp-config.php" ]; then
    chown -R www-data:www-data /var/www/
    wp core download --allow-root
    mv /var/www/wp-config-sample.php /var/www/wp-config.php
    sed -i -r "s/database_name_here/$DB_NAME/1" /var/www/wp-config.php
    sed -i -r "s/username_here/$DB_USER/1" /var/www/wp-config.php
    sed -i -r "s/password_here/$DB_PASS/1" /var/www/wp-config.php
    sed -i -r "s/localhost/mariadb/1"    /var/www/wp-config.php
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    mkdir /run/php
fi
/usr/sbin/php-fpm7.4 -F
