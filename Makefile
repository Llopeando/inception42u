#Variables
NAME = Dockerfile
DOCKER_COMPOSE_LOC = ./srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	make start

#Independent commands
build:
	docker compose -f $(DOCKER_COMPOSE_LOC) build
up:
	docker compose -f $(DOCKER_COMPOSE_LOC) up -d
stop:
	@echo "\033[1;33mStopping containers... \033[0m\033[30m(cmd: docker compose -f stop)\033[0m"
	@docker compose -f $(DOCKER_COMPOSE_LOC) stop
	@echo "\033[1;32mDone!\033[0m"
down:
	docker compose -f $(DOCKER_COMPOSE_LOC) down --volumes | docker system prune -f
clean:
	docker rmi -f srcs-wordpress srcs-mariadb srcs-nginx

#Main Makefile commands
start:
	@echo "\033[1;33mBuilding containers...\033[0m"
	make build
	@echo "\033[1;33mChecking that everything has been correctly built...\033[0m"
	@sleep 1
	make up
	@echo "\033[1;32mAll has been made!\033[0m You can access them using your favorite explorer with \033[1;37mhttps://ullorent.42.fr\033[0m"
stopandrun: stop up
restart:
	@echo "\033[1;33mRestarting containers... \033[0m\033[30m(cmd: docker restart)\033[0m"
	@docker restart $$(docker ps -a -q)
	@echo "\033[1;32mDone!\033[0m"
status:
	docker ps

#Cleaning commands
prune:
	docker system prune -f
container-removal:
	docker rm -f $$(docker ps -a -q)	
force-stop:
	@echo "\033[1;33mForcing containers to stop... \033[0m\033[30m(cmd: docker compose -f stop)\033[0m"
	@docker compose -f $(DOCKER_COMPOSE_LOC) stop
	@make down
	@echo "\033[1;32mDone!\033[0m"
	@echo "\033[1;31mPruning... \033[0m\033[30m(cmd: docker system prune -f)\033[0m"
	@docker rm -f $$(docker ps -a -q) && docker system prune -f
	@echo "\033[1;32mDone!\033[0m"