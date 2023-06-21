FROM debian:buster

# Update, install and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

# Script and .sql file copy
RUN mkdir -p /var/local/bin
RUN mkdir -p /var/local/mysql
COPY tools/init.sh /var/local/bin
COPY config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /var/local/bin/init.sh

# Permissions setter for mysqld
RUN chown -R mysql:mysql /var/run/mysql && chmod 755 /var/run/mysql

CMD ["/bin/bash", "-c", "/var/local/bin/init.sh && mysqld --bind-address=0.0.0.0"]