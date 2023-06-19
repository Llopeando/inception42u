FROM debian:buster

# Update, install and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

# Script and .sql file copy
COPY conf/create_table.sql /var/local/bin
COPY tools/init.sh /var/local/bin
RUN chmod +x /var/local/bin/init.sh && /var/local/bin/init.sh
RUN chmod +x /var/local/bin/create_table.sql

# Permissions setter for mysqld
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld
EXPOSE 3306

WORKDIR /usr/local/

CMD ["mysqld", "--bind-address=0.0.0.0"]