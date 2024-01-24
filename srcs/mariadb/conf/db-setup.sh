#!/bin/bash

# Start the MySQL service
service mysql start


touch myscript.sql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;" \
	> myscript.sql


# Print the contents of the myscript.sql for debugging
echo "Contents of myscript.sql:"
cat myscript.sql

# Sleep for a short while to allow a human to read the printed script
sleep 10

# Execute the SQL script
mysql < myscript.sql

# Stop the MySQL service by killing the mysqld process
kill $(cat /var/run/mysqld/mysqld.pid)

# Start the mysqld process in the foreground (daemon) to keep the container running
mysqld
