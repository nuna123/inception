#!/bin/bash

# Start the MySQL service to be able to run the script
service mysql start


touch myscript.sql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;" \
	> myscript.sql

# Execute the SQL script
mysql < myscript.sql

# Stop the MySQL service
service mysql stop

# Start the mysqld deamon in the foreground to keep the container running
mysqld
