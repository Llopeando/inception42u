#!/bin/bash

# Wordpress initial download
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Move files to the html directory
mv wordpress/* /var/www/html/
rm -rf wordpress/
rm -rf latest.tar.gz

# Wordpress configuration file creator
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/dbhost_here/mariadb/g" /var/www/html/wp-config.php