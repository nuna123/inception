MARIADB:

Dockerfile:
	pretty straight forward, install everything, expose port...
	The sh script creates the actual mysql script that created database and user, and checks if it needs to be run.

./conf/db-setup.sh
	creates myscipt.sql, which initializes the actual database and users.
	this is created from a script to allow environment variables.
	not sure