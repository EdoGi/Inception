NAME = inception

$(NAME): create_dir
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

all:  $(NAME)

# **************************************************************************** #
#  Manipulations                                                          #
# **************************************************************************** #

create_dir:
	@mkdir -p /home/edogi/data/mariadb
	@mkdir -p /home/edogi/data/wordpress
	@sudo chmod 777 /home/edogi/data/mariadb
	@sudo chmod 777 /home/edogi/data/wordpress

build:
	@sudo docker compose build

up:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down --rmi all

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean:	down
	@sudo rm -rf /home/edogi/data/mariadb
	@sudo rm -rf /home/edogi/data/wordpress
	@sudo docker system prune -af

re: clean all

# **************************************************************************** #
#  Inspections                                                            #
# **************************************************************************** #
list:
	@sudo docker compose -f ./srcs/docker-compose.yml ls

logs:
	@sudo docker compose -f ./srcs/docker-compose.yml logs

info:
	@echo "=============================== IMAGES ==============================="
	@docker images
	@echo
	@echo "============================= CONTAINERS ============================="
	@docker ps -a
	@echo
	@echo "=============== NETWORKS ==============="
	@docker network ls
	@echo
	@echo "====== VOLUMES ======"
	@docker volume ls
	
.PHONY: all re create_dir up down clean fclean info logs list
