#!/bin/sh

# Creates the config file for wordpress if not created already
if [ -f ./wp-config.php ]
then
	echo "Wordpress already downloaded"
else
	wp core download --allow-root
	# wget http://wordpress.org/latest.tar.gz
	# tar xfz latest.tar.gz
	# mv wordpress/* .
	# rm -rf latest.tar.gz
	# rm -rf wordpress
	echo "1111"
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	echo "22222"

fi

exec "$@"
