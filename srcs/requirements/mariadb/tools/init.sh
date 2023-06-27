#!/bin/bash

# We will restart the MySQL service so everything is good
sed -i "s/^bind-address\s*=.*$/#bind-address = 127.0.0.1/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/skip-networking/#skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/#\?port\s*=.*/port = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

/etc/init.d/mysql restart

# Create Wordpress database and its user
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
