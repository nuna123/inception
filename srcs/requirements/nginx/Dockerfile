FROM debian:oldstable

#install nginx and openssl
RUN apt-get -y update
RUN apt-get -y install nginx openssl

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
#the file location is from the default nginx conf file at /etc/nginx/nginx.conf
#include line says:include /etc/nginx/sites-enabled/*;
COPY conf/mynginxserver.conf /etc/nginx/sites-enabled/myconfig.conf


COPY ./conf/entrypnt.sh /usr/local/bin/entrypnt.sh
# Make the script executable
RUN chmod +x /usr/local/bin/entrypnt.sh
ENTRYPOINT ["entrypnt.sh"]

# #the only port allowed
EXPOSE	443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]