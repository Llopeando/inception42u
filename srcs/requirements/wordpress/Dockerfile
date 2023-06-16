FROM debian:buster

# Update, install and update "trash" cleaning
RUN apt-get update && apt-get install -y wget unzip vim php php-mysql php-gd php-curl php-xml php-fpm && rm -rf /var/lib/apt/lists/*

# Configuration copy and php config fix
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# Create the PID directory
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html/php

# Everything starting from here, will be done in /var/www/html
# It will copy the script init.sh inside html and run it, so it will install Wordpress
WORKDIR /var/www/html

COPY tools/init.sh /var/www/html
RUN chmod +x /var/www/html/init.sh && /var/www/html/init.sh

EXPOSE 9000

# nginx default html website removal and php starter
CMD ["rm", "-rf", "index.nginx-debian.html"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]