# -f: specify the path to the Compose file
all: create_dir
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

re: clean all

# -p: create parent directories along with the specified directory, if they don't already exist
create_dir:
	@sudo mkdir -p /home/edogi/data/mariadb
	@sudo mkdir -p /home/edogi/data/wordpress
	@sudo chmod 777 /home/edogi/data/mariadb
	@sudo chmod 777 /home/edogi/data/wordpress

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

# down: stops and removes the containers defined in the Docker Compose file
# -v: Removes the volumes associated with the containers.
clean: stop
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

# docker system prune -af command: remove unused Docker resources, including containers, networks, volumes, and images, freeing up disk space on your system
fclean: clean
	@sudo rm -rf /home/edogi/data/mariadb
	@sudo rm -rf /home/edogi/data/wordpress
	@sudo docker system prune -af

.PHONY: all re create_dir stop clean fclean