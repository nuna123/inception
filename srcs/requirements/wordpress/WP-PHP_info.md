**WP / PHP:**

	Wordpress is a CMS - content management system that helps manage websites. it used PHP and Mariadb.
	PHP is a general-usage language geared towards web development. It sucks.
	PHP FPM (FastCGI Process Manager) is used as part of a solution to connect nginx and wp. nginx doesnt understand php, so it sends requests with FastCGI.

**Needs to be done:**
	install php and wp
	install wp command line tool - which helps config the wp database.
	config php fpm to listen for the nginx requests on port 9000.
	configure wp to know where to expect the database


**Dockerfile:**
	• Install everything for php and wp, i dont know how many of these packages are actually needed but when i tried to simplify it it broke :))
	• copy wp-cli and add it to the bin folder to make it executable
	• copy the php config file
	• add the wp init script as the etrypoint, to make it run on container start.
	• set the working dir to the site dir instead of /. this way the entrypoint script will run from there.
	• expose port 9000 for communication with nginx
	• CMD to start the actual service in the foreground and keep the container running.


**./conf/wp_setup.sh**
	• if wp-config does not already exist, download wordpress and init it with the correct database which will be hosted on the mariadb container.
**./conf/www.conf**
	The php fpm config file. set up to listen on 9000. The original www.conf is there for reference.


**NOTE**
in a lot of other gits, the creators dont use a dependency on the Mariadb container.
This is because they also manually download the wordpress ZIP and extract it rather than use [wp core download]. This takes much more time, which allows Mariadb to initialize.
If the dependancy and health check isnt used when using this method, then
	Mariadb doesnt have time to initialize the socket,
	database can't be reached
	so WP doesn't create the wp-config file (which doesn't actually crashes the container, so it doesn't restart)
	and an error page appears on the website.

