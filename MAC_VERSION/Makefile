NAME = inception

$(NAME): create_dir
	docker-compose -f ./srcs/docker-compose.yml up -d --build

all:  $(NAME)

# **************************************************************************** #
#  Manipulations                                                          #
# **************************************************************************** #

create_dir:
	@mkdir -p /Users/giaco/data/mariadb
	@mkdir -p /Users/giaco/data/wordpress
	@chmod 777 /Users/giaco/data/mariadb
	@chmod 777 /Users/giaco/data/wordpress

build:
	@docker-compose build

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v

fclean:	down
	@rm -rf /Users/giaco/data/mariadb
	@rm -rf /Users/giaco/data/wordpress
	@docker system prune -af

re: clean all

# **************************************************************************** #
#  Inspections                                                            #
# **************************************************************************** #
list:
	@docker-compose -f ./srcs/docker-compose.yml ls

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs

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
