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

clean:	stop
	@docker compose -f ./srcs/docker-compose.yml down -v

fclean:	down
	@rm -rf /Users/giaco/data/mariadb
	@rm -rf /Users/giaco/data/wordpress
	@docker system prune -af

re: clean all

.PHONY: all re create_dir stop clean fclean

# **************************************************************************** #
#  Inspections                                                            #
# **************************************************************************** #
list:
	docker-compose -f ./srcs/docker-compose.yml ls

logs:
	docker-compose -f ./srcs/docker-compose.yml logs
