#!/bin/bash

# MySQL data directory initialization (using a pre-included initialization script)
mysql_install_db

# Start the MySQL service
service mysql start

# Start the MySQL service with custom configuration
mysqld --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf &

# # Wait for the MySQL service to start
# until mysqladmin ping &>/dev/null; do
# 	sleep 1
# done

# Set root user password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';"
mysql -e "FLUSH PRIVILEGES;"

# Grant privilegies to root user
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql
mysql -e "FLUSH PRIVILEGES;" | mysql

# Create Wordpress database and its user
mysql -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the MySQL service
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD reload