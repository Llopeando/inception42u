FROM debian:buster

# Script file copy
COPY tools/init.sh /home

ENV MYSQL_ROOT_PASSWORD=rootie \
	MYSQL_USER=ullorent \
	MYSQL_PASSWORD=admin \
	WORDPRESS_DB_USER=ullorent \
	WORDPRESS_DB_PASSWORD=admin \
	WORDPRESS_DB_NAME=wordpress

# Update, install, MySQL service start and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server mariadb-client && service mysql start && chmod +x /home/init.sh && ./home/init.sh  && rm -rf /var/lib/apt/lists/*

CMD ["mysqld"]