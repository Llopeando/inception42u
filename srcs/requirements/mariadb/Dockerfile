FROM debian:buster

# Update, install and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

# Script and .sql file copy
RUN mkdir -p /var/local/bin
RUN mkdir -p /var/run/mysqld
COPY tools/init.sh /var/local/bin
RUN chmod +x /var/local/bin/init.sh

# Permissions setter for mysqld
RUN chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

# # Create the socket file
# RUN touch /var/run/mysqld/mysqld.sock && chown mysql:mysql /var/run/mysqld/mysqld.sock

CMD ["/bin/bash", "-c", "/var/local/bin/init.sh && mysqld --bind-address=127.0.0.1"]
