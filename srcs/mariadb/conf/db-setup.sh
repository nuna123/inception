#!/bin/bash

# Start the MySQL service
service mysql start

# Create the db1.sql file with commands
# (we cannot read environment variables in the mysql command directly)
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql


# Execute the SQL script
mysql < db1.sql

# Stop the MySQL service by killing the mysqld process
kill $(cat /var/run/mysqld/mysqld.pid)

# Start the mysqld process in the foreground (daemon) to keep the container running
mysqld
