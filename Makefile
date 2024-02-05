
NAME		= inception
SRC			= ./srcs/docker-compose.yaml
CHECK_ENV	= ./srcs/check_env.sh

#colors
YELLOW		= "\033[0;33m"
NRM			="\033[0;37m"
##


${NAME}		: build up
all			: ${NAME}

check_env:
	@echo ${YELLOW}
	@sh ./srcs/check_env.sh || (exit 1)
	@echo ${NRM}

build: check_env
	docker compose -f ${SRC} build

up:
	docker compose -f ${SRC} up

down:
	docker compose -f ${SRC} down

deletevol:
	sudo rm -rf ~/data/wordpress/* && sudo rm -rf ~/data/mysql/*

clean:
	docker system prune -f

fclean: deletevol
	docker system prune -fa

re: clean deletevol ${NAME}


# docker rmi $(docker images -q) -f
# docker rm $(docker ps -aq)
# docker volume rm $(docker volume ls -q)
