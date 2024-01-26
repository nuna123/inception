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


server config:
	set up port to  3306 => commented by default
	set up bind-address to local computer
		The address you specify in bind tells MySQL where to listen. Only client software which is able to open a connection to the server using the same address that is specified in the 'bind' option will be allowed to connect.
		If MySQL binds to 127.0.0.1, then only software on the same computer will be able to connect (because 127.0.0.1 is always the local computer).

Skip-networking in MySQL
It disables TCP/IP networking for MySQL, ensuring the server only accepts connections from clients running on the same host.
