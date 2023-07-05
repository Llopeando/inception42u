FROM debian:buster

# Update, install, NGINX service start and "trash" cleaning
RUN apt-get update && apt-get install -y vim nginx && rm -rf /var/lib/apt/lists/*

# Initial nginx configuration deleter and SSL folder creator
RUN mkdir -p /etc/nginx/ssl
RUN rm -f /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

# Our own config and ssl copy
COPY conf/default.conf /etc/nginx/conf.d/
COPY tools/server.crt /etc/nginx/ssl
COPY tools/server.key /etc/nginx/ssl

# The only way to access our website will be via SSL port (443)
EXPOSE 443

# nginx starter in PID 1
CMD ["nginx", "-g", "daemon off;"]