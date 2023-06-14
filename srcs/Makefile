#Independent commands
build:
	docker compose build
run:
	docker compose up -d
stop:
	docker compose stop
down:
	docker compose down
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
force-stop: stop
	docker rm -f $$(docker ps -a -q) && docker system prune -f