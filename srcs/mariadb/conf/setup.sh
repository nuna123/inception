#!/bin/bash


# ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
# Start the MySQL service to be able to run the script
echo "mdb -1/5-"
service mysql start

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
FLUSH PRIVILEGES;" \
	> myscript.sql

echo "mdb -2/5-"

# cat myscript.sql
# Execute the SQL script
# mysql --user=root --password=$DB_ROOT_PASSWORD < myscript.sql
sleep 1
mysql -u root < myscript.sql
echo "mdb -3/5-"


# Stop the MySQL service
# service mysql stop
kill $(cat /var/run/mysqld/mysqld.pid)
echo "mdb -4/5-"

touch healthcheck.txt
echo "mdb -5/5-"

# Start the mysqld deamon in the foreground to keep the container running
mysqld_safe


#Healthcheck???
##mysqlshow -u root && (mysqlshow -u root | grep wordpress)
