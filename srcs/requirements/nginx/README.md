Generate SSL certificate: openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes -subj "/CN=ullorent.42.fr" && chmod 600 server.*

Delete and clean: docker stop nginx-container && docker rm nginx-container && docker system prune -f

Build and run: docker build -t nginx-build . && docker run -d --name nginx-container -p 443:443 nginx-build

Delete, clean, build and run: docker stop nginx-container && docker rm nginx-container && docker system prune -f && docker rmi nginx-build && docker build -t nginx-build . && docker run -d --name nginx-container -p 443:443 nginx-build