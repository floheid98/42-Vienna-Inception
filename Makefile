
# build all containers
build:
	docker build -t nginx:1.0 ./srcs/images/nginx

# run all containers
run:
	docker run -d --name my_nginx -p 8042:443 nginx:1.0

# stop all containers listed in "docker ps -a"
stopall:
	@docker stop ${shell docker ps -a -q}

# rm all containers listed in "docker ps -a"
rmall:
	@docker rm ${shell docker ps -a -q}

# rm all images listed in "docker images -q"
rmiall:
	@docker rmi ${shell docker images -q}

# stopall + rmall + rmiall
clean:
	@docker stop ${shell docker ps -a -q}
	@docker rm ${shell docker ps -a -q}
	@docker rmi ${shell docker images -q}

# phony targets
.PHONY: build run stopall rmall rmiall clean
