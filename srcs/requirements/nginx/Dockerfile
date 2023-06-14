FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN rm -f /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

COPY conf/default.conf /etc/nginx/conf.d/
COPY index.html /var/www/html/index.html

COPY ssl/server.crt /etc/nginx/ssl
COPY ssl/server.key /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]