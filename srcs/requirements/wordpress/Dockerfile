FROM debian:buster

# Update, install and "trash" cleaning
RUN apt-get update && apt-get install -y wget unzip vim php php-mysql php-gd php-curl php-xml php-fpm mariadb-client && rm -rf /var/lib/apt/lists/*

# Configuration and script copy
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY tools/init.sh /home

# Create the PID directory and give neccesary permissions
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html/php
RUN chmod +x /home/init.sh

# Wordpress initial installation script runner and ph-fpm starter (';' executes first the left command and then the right command)
CMD ["/bin/bash", "-c", "/home/init.sh; /usr/sbin/php-fpm7.3 -F"]
