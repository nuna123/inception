#!/bin/sh


# NOTE: [wp config create] doesnt work for some reason,
## but does work with the actual executable. idfk
##update: now it does???? a miracle
## update: doesnt
## update: does. the problem is somewhere else
## doesnt ugh

# Creates the config file for wordpress if not created already
# the config file needs to be created only on the first run,
## it may already be initialized in the volume.
if [ ! -f ./wp-config.php ]
then
	echo "wp -1/5-"
	wp core download --allow-root
	echo "wp -2/5-"
	wp config create \
		--dbhost=$DB_HOST \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--allow-root
	echo "wp -3/5-"
	wp core install\
		--url=$DOMAIN_NAME \
		--title="$WP_SITENAME" \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMINPASS \
		--admin_email=$WP_ADMIN"@"$DOMAIN_NAME \
		--allow-root

	echo "wp -4/5-"
	wp user create $WP_USER $WP_USER'@'$DOMAIN_NAME \
				--user_pass=$WP_USERPASS \
				--allow-root
	echo "wp -5/5-"
fi
echo "Wordpress up!"

#$@: basically takes any command line arguments passed to entrypoint.sh
	# and execs them as a command.
	# The intention is basically "Do everything in this .sh script,
	# then in the same shell run the command the user passes in on the
	# command line".
exec "$@"