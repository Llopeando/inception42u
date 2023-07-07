#!/bin/bash

chown -R mysql /var/lib/mysql

# We will restart the MySQL service so everything is good
sed -i "s/^bind-address\s*=.*$/#bind-address = 127.0.0.1/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/skip-networking/#skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/#\?port\s*=.*/port = 3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

/etc/init.d/mysql restart

# Create Wordpress database and its admin and non-admin user
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$WORDPRESS_MOD_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_MOD_DB_PASSWORD';"
mysql -u root -e "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"

# Non admin privileges setter
mysql -u root -e "GRANT SELECT, INSERT, UPDATE, DELETE ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_MOD_DB_USER'@'%';"

# Admin privileges setter
mysql -u root -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';"

# We apply the privileges changes
mysql -u root -e "FLUSH PRIVILEGES;"

service mysql restart