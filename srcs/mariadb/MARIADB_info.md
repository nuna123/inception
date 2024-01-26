MARIADB:
	MariaDB is a modified version of MySQL. It evolved, and offers all the functionality of MySQL, plus added features. It became a default Database solution for many CMS (content managemystems), including Wordpress.
	More info about differences:
		https://www.cloudways.com/blog/mariadb-vs-mysql

Needs to be done:
	create a Databse, with one admin and one user.
	Expect connection on port 3306 from wordpress container.


Dockerfile:
	pretty straight forward, install everything, expose port...

./conf/setup.sh
	creates myscipt.sql, which initializes the actual database and users.
	It is generated from a shell script to allow environment variables.
