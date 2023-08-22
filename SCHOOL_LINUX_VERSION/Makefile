NAME = inception

$(NAME): create_dir
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

all:  $(NAME)

# **************************************************************************** #
#  Manipulations                                                          #
# **************************************************************************** #

create_dir:
	@mkdir -p /home/egiacomi/data/mariadb
	@mkdir -p /home/egiacomi/data/wordpress
	@sudo chmod 777 /home/egiacomi/data/mariadb
	@sudo chmod 777 /home/egiacomi/data/wordpress

build:
	@sudo docker compose build

up:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down --rmi all

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean:	down
	@sudo rm -rf /home/egiacomi/data/mariadb
	@sudo rm -rf /home/egiacomi/data/wordpress
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
	@sudo docker images
	@echo
	@echo "============================= CONTAINERS ============================="
	@sudo docker ps -a
	@echo
	@echo "=============== NETWORKS ==============="
	@sudo docker network ls
	@echo
	@echo "====== VOLUMES ======"
	@sudo docker volume ls
	
.PHONY: all re create_dir up down clean fclean info logs list
