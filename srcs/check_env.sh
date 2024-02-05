#!/bin/sh
echo "looking for volume folders..."

if	test -d ~/data && \
	test -d ~/data/mysql && \
	test -d ~/data/wordpress
then
	echo "folders found!"
else
	echo "please create /home/nroth/data/mysql and /home/nroth/data/mysql!"
	exit 1
fi

echo "looking for ./srcs/.env file..."

if [ ! -f ./srcs/.env ]
then
	echo ".env file missing!"
	exit 1
fi

echo "found! looking for all variables..."
#checks that all vars exist
if  $(cat ./srcs/.env | grep 'DOMAIN_NAME' -q) && \
	$(cat ./srcs/.env | grep 'DB_HOST' -q) && \
	$(cat ./srcs/.env | grep 'DB_NAME' -q) && \
	$(cat ./srcs/.env | grep 'DB_USER' -q) && \
	$(cat ./srcs/.env | grep 'DB_PASSWORD' -q) && \
	$(cat ./srcs/.env | grep 'DB_ROOT_PASSWORD' -q)
then
	echo "nice!"
	exit 0
else
	echo "Some vars may be missing!
		[DOMAIN_NAME DB_HOST DB_NAME DB_USER DB_PASSWORD DB_ROOT_PASSWORD]"
	exit 1
fi

