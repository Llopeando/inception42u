FROM debian:buster

# Update, install, MySQL service start and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server && service mysql start && rm -rf /var/lib/apt/lists/*

# Script file copy
COPY tools/init.sh /home
RUN chmod +x /home/init.sh

ENV MYSQL_ROOT_PASSWORD=rootie \
	MYSQL_USER=ullorent \
	MYSQL_PASSWORD=admin \
	WORDPRESS_DB_USER=ullorent \
	WORDPRESS_DB_PASSWORD=admin \
	WORDPRESS_DB_NAME=wordpress

# MySQL folder permissions and script initialization
RUN chown -R mysql /var/lib/mysql && ./home/init.sh

EXPOSE 3306

CMD ["mysqld"]