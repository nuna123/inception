**MARIADB:**

	MariaDB is a modified version of MySQL. It evolved, and offers all the functionality of MySQL plus added features. It became a default Database solution for many CMS (content management systems), including Wordpress.
	More info about differences:
		https://www.cloudways.com/blog/mariadb-vs-mysql

**Needs to be done:**
	create a Databse, with one admin and one user.
	Expect connection on port 3306 from wordpress container.


**Dockerfile:**
	pretty straight forward, install everything, expose port...

**./conf/setup.sh**
	• start the mysql service in order to be able to run the mysql script.
	• creates myscipt.sql, which initializes the actual database and users.
		It is generated from a shell script to allow environment variables.
	• execute the script as root. by default the root's password isnt set which allows to log in as root without password.
	• Stop the mysql service in order to run mysql_safe in foreground. using [service mysql stop] gives an error bc it should apparently be run as root so its better to violently kill it.
		--edit: that doesnt make any sense. there isnt root in the container. too late to change
	• create the healthcheck file. a stupid solution but it works lol.
	• run the actual foreground process that keeps the container running.

**server config:**
***Gets copied to /etc/mysql/mariadb.conf.d/50-server.cnf even though online it says default config of the mysql deamon needs to be in /etc/mysql/my.cnf. It didnt work when i copied it there, idfk***
	set up port to  3306 => commented by default


