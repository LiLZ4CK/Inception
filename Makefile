name = inception

all:
	@printf "Launch  ${name}\n\n\n"
	@bash srcs/requirements/wordpress/tools/mkdr.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/mkdr.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build

stop:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env stop

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY: all build stop re clean fclean
