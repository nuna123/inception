
FROM debian:buster

# Install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server

# Copy the configurations and script
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

##TEST
COPY ./conf/my.cnf /etc/mysql/
##

COPY ./conf/setup.sh /usr/local/bin/setup.sh

# Make the script executable
RUN chmod +x /usr/local/bin/setup.sh

# Expose port 3306 for MariaDB
EXPOSE 3306

# Set the entrypoint to the database setup script
ENTRYPOINT ["setup.sh"]

# By default, start mysqld_safe (This will be run by the db-setup.sh script)
CMD ["mysqld_safe"]
