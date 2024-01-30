
build:
	docker compose -f $(SRC) build

up: build
	docker compose -f $(SRC) up -d





deletevol:
	sudo rm -rf ~/data/wordpress/* && sudo rm -rf ~/data/mysql/*

clean: deletevol
	docker system prune -f

all: clean deletevol up