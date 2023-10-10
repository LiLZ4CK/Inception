#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
mariadb-install-db
# Start the MariaDB service

service mariadb start


# Create the database
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

# Create the user and grant privileges
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}' IDENTIFIED BY '${DB_PASS}';"
#mysql -e "GRANT ALL PRIVILEGES ON '${DB_NAME}' TO '${DB_USER}' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';"
# Flush privileges
mysql -e "FLUSH PRIVILEGES;"

# Stop the MariaDB service
service mariadb stop

#mariadbd
/usr/sbin/mysqld --skip-log-error
#mysqld
