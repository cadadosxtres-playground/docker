build:
	UID=$(shell id -u) GID=$(shell id -g) docker compose build

run:
	UID=$(shell id -u) GID=$(shell id -g)  docker-compose run app

clean:
	docker rm -f $(shell docker ps -a --filter name=docker-app -q)
	docker rmi -f docker-app
	docker volume rm -f $(shell docker volume ls --filter name=docker_app -q)