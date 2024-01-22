FROM debian:buster

RUN apt-get -y update

#install php-fpm
# RUN apt-get install -y php7.3\
# 						php-fpm\
# 						php-mysql\
# 						mariadb-client
RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*
# RUN apt-get install -y php\
# 	php-fpm

# install wp-cli (command line interface)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# To be able to type just wp, instead of php wp-cli.phar, you need to make the
#	file executable and move it to somewhere in your PATH.
RUN chmod +x wp-cli.phar \
	&& cp wp-cli.phar /usr/local/bin/wp

#install wp
# RUN mkdir /var/www
# RUN wp core download --path=/var/www/html --allow-root

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# RUN apt-get install -y curl unzip
# RUN curl https://wordpress.org/latest.zip  -L -o lastest_wp.zip

# RUN ./wp-cli.phar config create \
# 	--path=/var/www \# 	--dbhost=mariadb \
# 	--dbname=wordpress \
# 	--dbpass=pass \
# 	--dbuser=user \
# 	--allow-root
#THIS HAS TO BE RUN ONLY AFTER MARIADB IS INITIALIZED, OTHERWISE WP CANT FIND HOST AND FREAKS OUT,
#THEREFORE - PUT IN SEPARATE SCRIPT AND RUN ON 'UP' AND NOT ON 'BUILD'
# RUN ./wp-cli.phar config create --path=/var/www --dbhost=mariadb --dbname=wordpress --dbpass=pass --dbuser=user --allow-root
# COPY ./wp_setup.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/wp_setup.sh
# ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]
# WORKDIR /var/www/html
#use my phpfpm config
RUN mkdir /run/php

COPY ./wp_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup.sh
ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]
WORKDIR /var/www/html/


#for nginx communication
EXPOSE 9000

# RUN service php7.4-fpm start
CMD ["/usr/sbin/php-fpm7.3", "-F"]