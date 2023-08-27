all: build

up:
	@docker compose -f srcs/docker-compose.yml up -d

build: setup
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down
	@docker compose -f srcs/docker-compose.yml up -d --build

clean: down
	@docker system prune -f

fclean: clean
	sudo rm -rf ~/data/
	sudo sed -in '/127.0.0.1 lpires-n.42.fr/d' /etc/hosts

setup:
	sudo mkdir -p ~/lpires-n.42.fr/data ~/lpires-n.42.fr/data/mariadb ~/lpires-n.42.fr/data/wordpress
	grep "lpires-n.42.fr" /etc/hosts || echo "127.0.0.1 lpires-n.42.fr" >> /etc/hosts

.PHONY: all build down re clean fclean ls
