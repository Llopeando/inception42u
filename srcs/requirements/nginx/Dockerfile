FROM debian:buster

RUN apt-get update && apt-get install -y vim nginx

RUN mkdir -p /etc/nginx/ssl
RUN rm -f /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

COPY conf/default.conf /etc/nginx/conf.d/
COPY tools/server.crt /etc/nginx/ssl
COPY tools/server.key /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]