#!/bin/bash

# MySQL data directory initialization (using a pre-included initialization script)
mysql_install_db

/etc/init.d/mysql start

# Grant privilegies to root user
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# Keep the container running
tail -f /dev/null