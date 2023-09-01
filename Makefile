all: build

up:
	docker-compose -f srcs/docker-compose.yml up -d

build: setup
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

re: down
	docker-compose -f srcs/docker-compose.yml up --build

clean: down
	docker system prune -f --volumes

fclean: clean
	sudo rm -rf /home/lpires-n/
	sudo sed -in '/127.0.0.1 lpires-n.42.fr/d' /etc/hosts
ls:
	docker container ls
	docker image ls
	docker volume ls
	docker network ls -f type=custom

setup:
	sudo mkdir -p /home/lpires-n/data/mariadb
	sudo mkdir -p /home/lpires-n/data/wordpress
	sudo bash -c "grep 'lpires-n.42.fr' /etc/hosts || echo '127.0.0.1 lpires-n.42.fr' >> /etc/hosts"

.PHONY: all up build down re clean fclean setup ls
