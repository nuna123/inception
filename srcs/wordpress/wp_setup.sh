#!/bin/sh


# NOTE: [wp config create] doesnt work for some reason,
## but does work with the actual executable. idfk

##update: now it does???? a miracle


# Creates the config file for wordpress if not created already
# the config file needs to be created only on the first run,
## it may already be initialized in the volume.
if [ ! -f ./wp-config.php ]
then
	wp core download --allow-root
	wp config create \
		--dbhost=$DB_HOST \
		--dbname=$DB_NAME\
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--allow-root
fi

# something with signaling? idk but best practice is to add
## it at the end of entrypoint script
exec "$@"
