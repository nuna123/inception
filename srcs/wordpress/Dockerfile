FROM debian:buster

RUN apt-get -y update

#install php-fpm
# RUN apt-get -y install \
# 	curl \
# 	php \
# 	php-cgi \
# 	php-mysql \
# 	php-fpm \
# 	php-pdo \
# 	php-gd php-cli \
# 	php-mbstring \
# 	redis \
# 	php-redis \
# 	&& rm -rf /var/lib/apt/lists/*

RUN apt install php php-fpm php-mysql -y

RUN apt install curl -y


# install wp-cli (command line interface)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# To be able to type just wp, instead of php wp-cli.phar, you need to make the
#	file executable and move it to somewhere in your PATH.
RUN chmod +x wp-cli.phar \
	&& cp wp-cli.phar /usr/local/bin/wp

#custom config file for php-fpm
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#This script has to run only after mariaDB is build,Otherwise WP cant find the database host and freaks out,
#THEREFORE - PUT IN SEPARATE SCRIPT AND RUN ON 'UP' AND NOT ON 'BUILD'
COPY ./wp_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup.sh
ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]
	#makes sure the script runs from here
WORKDIR /var/www/html/

#php-fmp tries to create a file in this folder, but it doesnt exist by default.
#	create the folder to avoid err
RUN mkdir /run/php

#for nginx communication
EXPOSE 9000

# RUN service php7.4-fpm start
CMD ["/usr/sbin/php-fpm7.3", "-F"]