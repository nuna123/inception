FROM debian:oldstable

#install nginx and openssl
RUN apt-get -y update 
RUN apt-get -y install nginx
RUN apt-get install openssl -y

#generate ssl certificates in set directory
	#req - create certificates
	#x509 - certificate type
	#nodes - [no DES(Data Encryption Standard)] makes sure the private key wont be encrypted
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/CN=MY_CERT/C=CZ/L=Praga/O=42/OU=42/UID=nroth"

#copy my conf file into the nginx folder.
#by default any .conf file in /etc/nginx is used
# COPY conf/nginx.conf /etc/nginx/sites-enabled/my_conf.conf
COPY conf/my_nginx.conf /etc/nginx/nginx.conf

COPY ./index.html /var/www/html/index.html
# COPY ./nginx_server.conf /etc/nginx/nginx_server.conf

# #the only port allowed
EXPOSE	443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]