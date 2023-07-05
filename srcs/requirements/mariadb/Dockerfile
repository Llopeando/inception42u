FROM debian:buster

# Script file copy
COPY tools/init.sh /home

# Update, install, MySQL service start and "trash" cleaning
RUN apt-get update && apt-get install -y vim mariadb-server mariadb-client && service mysql start && rm -rf /var/lib/apt/lists/*
RUN chmod +x /home/init.sh

# Run init.sh script for mysql and start mysqld (';' executes first the left command and then the right command)
CMD ["/bin/bash", "-c", "/home/init.sh; mysqld"]