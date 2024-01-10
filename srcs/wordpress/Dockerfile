FROM debian:oldstable

RUN apt-get -y update 

#install php-fpm
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client
# RUN apt-get install -y php\
# 	php-fpm

RUN apt-get install -y curl




# install wp-cli (command line interface)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# To be able to type just wp, instead of php wp-cli.phar, you need to make the
#	file executable and move it to somewhere in your PATH.
RUN chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp




#install wp
RUN mkdir /var/www \
	&& wp core download --path=/var/www/wordpress --allow-root
# RUN apt-get install -y curl unzip
# RUN curl https://wordpress.org/latest.zip  -L -o lastest_wp.zip


#use my phpfpm config

COPY ./conf/NUNA_phpfpm_conf /etc/php/7.3/fpm/pool.d/www.conf



#for nginx communication
EXPOSE 9000 

RUN service php7.4-fpm start
CMD ["/usr/sbin/php-fpm7.4", "-F"]