#Variables
DOCKER_COMPOSE_LOC = ./srcs/docker-compose.yml

#Independent commands
build:
	docker compose -f $(DOCKER_COMPOSE_LOC) build
run:
	docker compose -f $(DOCKER_COMPOSE_LOC) up -d
stop:
	docker compose -f $(DOCKER_COMPOSE_LOC) stop
down:
	docker compose -f $(DOCKER_COMPOSE_LOC) down
clean-volume:
	docker volume rm $$(docker volume ls -q)

#Main Makefile commands
start: build run
restart: stop run
status:
	docker compose ps

#Cleaning commands
prune:
	docker system prune -f
container-removal:
	docker rm -f $$(docker ps -a -q)
force-stop: stop
	docker rm -f $$(docker ps -a -q) && docker system prune -f