deletevol:
	sudo rm -rf ~/data/wordpress/* && sudo rm -rf ~/data/mysql/*

clean:
	docker system prune -f

all: clean deletevol