#!/bin/sh


# NOTE: [wp config create] doesnt work for some reason,
## but does work with the actual executable. idfk
##update: now it does???? a miracle
## update: doesnt
## update: does. the problem is somewhere else



# Creates the config file for wordpress if not created already
# the config file needs to be created only on the first run,
## it may already be initialized in the volume.
if [ ! -f ./wp-config.php ]
then
	echo "wp -1/3-"
	wp core download --allow-root
	echo "wp -2/3-"
	/usr/local/bin/wp.phar config create \
		--dbhost=$DB_HOST \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--allow-root
	echo "wp -3/3-"
fi
echo "Wordpress up!"
# something with signaling? idk but best practice is to add
## it at the end of entrypoint script
exec "$@"