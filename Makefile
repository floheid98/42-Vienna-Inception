build: 
	docker compose -f ./srcs/docker-compose.yml build
up: 
	docker compose -f ./srcs/docker-compose.yml up -d
upc:
	docker compose -f ./srcs/docker-compose.yml build --no-cache
	docker compose -f ./srcs/docker-compose.yml up -d
down: 
	docker compose -f ./srcs/docker-compose.yml down	

clean:
	@docker stop ${shell docker ps -a -q}
	@docker rm ${shell docker ps -a -q}
	@docker rmi ${shell docker images -q}

.PHONY: build up upc down clean
