#!/bin/bash

# MySQL data directory initialization (using a pre-included initialization script)
mysql_install_db

# Start the MySQL service
service mysql start

# Set root user password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';"
mysql -e "FLUSH PRIVILEGES;"

# Grant privilegies to root user
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

# Create Wordpress database and its user
mysql -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS 'WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO 'WORDPRESS_DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Restart the MySQL service
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD reload