FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]