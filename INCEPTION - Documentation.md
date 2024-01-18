INCEPTION - Documentation
hopefully to help me understand what to

/*

Docker tutorial, goes over basic docker commands, terminology, images and dockefiles
	https://docker-curriculum.com/

Containers vs VMs: What's the difference?
IBM Technology
	https://www.youtube.com/watch?v=cjXI-yxqGTI



*/



				     $$\                     $$\
				     $$ |                    $$ |
				$$$$$$$ | $$$$$$\   $$$$$$$\ $$ |  $$\  $$$$$$\   $$$$$$\
				$$  __$$ |$$  __$$\ $$  _____|$$ | $$  |$$  __$$\ $$  __$$\
				$$ /  $$ |$$ /  $$ |$$ /      $$$$$$  / $$$$$$$$ |$$ |  \__|
				$$ |  $$ |$$ |  $$ |$$ |      $$  _$$<  $$   ____|$$ |
				\$$$$$$$ |\$$$$$$  |\$$$$$$$\ $$ | \$$\ \$$$$$$$\ $$ |
				\_______| \______/  \_______|\__|  \__| \_______|\__|

Docker
	Supply containers  - an environment to run applications in, that is mostly isolated from the host and other containers.
	Containes the application and its dependencies only!


	|----VMS vs DOCKER:-----------------------------------------------------------------------------------------------------|
	|	VMS virtualize the OS Kernel, as well as the applications layer. meaning they boot their own OS with each instance.	|
	|	Docker containers only virtualize the Applications layer.															|
	|		this makes Docker more lightweight and faster to boot and run than a VM.										|
	|																														|
	|	VMS are completely isolated from eachother - HARDWARE ISOLATION.													|
	|	Docker containers are able to communicate and share resources.														|
	|	Compatibility:																										|
	|		VM of any OS can run on any OS host.																			|
	|		Docker is more limited - A Docker container may not be compatible with the Windows kernel.						|
	|-----------------------------------------------------------------------------------------------------------------------|

	namespaces:
		the isolation mechanism that allows multiple containers to run on the same host without interfering with each other.
	Cgroups:
		limtation and control of the resources each process is using

	Dockerfiles:
			basically a makefile for creating Docker Images.
			Dockerfile ref: https://docs.docker.com/engine/reference/builder/
	Docker Image:
		A Docker image is a pre-packaged, read-only template that contains everything needed to run an application, including the application code, dependencies, and any system libraries or configuration files. Images are created from a Dockerfile, which specifies the configuration and steps needed to build the image.
	Docker Container:
		A Docker container is a running instance of a Docker image. Containers are isolated environments that run an application and its dependencies, but with their own isolated file system, network, and resources. Containers are created from Docker images, and multiple containers can run from the same image.
	Docker Volume:
		A Docker volume is a persistent data storage area that can be used by one or more containers. Volumes are used to store data that needs to persist beyond the life of a container, such as application configuration files or user data. Volumes can be created and managed independently of containers and can be shared between containers.

										|----docker-compose.yml---------------------------------------------|
										|	A docker-compose.yml is a config file for Docker Compose.		|
										|	It allows to deploy, combine, and configure multiple docker		|
										|		containers at the same time. The Docker "rule" is to		|
										|		outsource every single process to its own Docker container.	|
										|	The advantage of Docker Compose is easy configuration.			|
										|		You don't have to write a big bunch of commands into Bash,	|
										|		You can predefine it in the docker-compose.yml.				|
										|	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!		|
										|	The key difference between the Dockerfile and docker-compose	|
										|	is that the Dockerfile describes how to build Docker images,	|
										|	while docker-compose is used to run Docker containers.			|
										|-------------------------------------------------------------------|


Docker commands:
	- run [img]	: run a docker image
		--rm	: delete the container after it closes
		-it		: attach the container to an interactive terminal.
		-d		: detach from current terminal, container ID gets printed and container runs in background.

	- stop		: stops a detached container. takes it's ID or name.

	- pull [img]: pull a docker image from the registry.
					if [RUN] doesn't find the image locally, it runs pull to search for it in online.

	- ps		: list all running docker containers
		-a		: lists all running and exited containers that were not deleted

	- rm		: when a container exits, it doesnt delete. a buildup of closed cotainers can take up space.
					the rm command takes either the container name or id.
					[docker rm $(docker ps -a -q -f status=exited)] will close all exited containers.

	- rmi		: can be used to delete images





$$$$$$$$\ $$\                        $$$$$$\                       $$\               $$\
\__$$  __|$$ |                      $$  __$$\                      $$ |              \__|
   $$ |   $$$$$$$\   $$$$$$\        $$ /  \__| $$$$$$\  $$$$$$$\ $$$$$$\    $$$$$$\  $$\ $$$$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\
   $$ |   $$  __$$\ $$  __$$\       $$ |      $$  __$$\ $$  __$$\\_$$  _|   \____$$\ $$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  _____|
   $$ |   $$ |  $$ |$$$$$$$$ |      $$ |      $$ /  $$ |$$ |  $$ | $$ |     $$$$$$$ |$$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|\$$$$$$\
   $$ |   $$ |  $$ |$$   ____|      $$ |  $$\ $$ |  $$ |$$ |  $$ | $$ |$$\ $$  __$$ |$$ |$$ |  $$ |$$   ____|$$ |       \____$$\
   $$ |   $$ |  $$ |\$$$$$$$\       \$$$$$$  |\$$$$$$  |$$ |  $$ | \$$$$  |\$$$$$$$ |$$ |$$ |  $$ |\$$$$$$$\ $$ |      $$$$$$$  |
   \__|   \__|  \__| \_______|       \______/  \______/ \__|  \__|  \____/  \_______|\__|\__|  \__| \_______|\__|      \_______/


• NGINX with TLSv1.2 or TLSv1.3 only.
	Nginx is a webserver which stores hmtl, js, images files and use http request to display a website. Nginx conf documents will be used to config our server and the right proxy connexion.
	TLS - Transport Layer Security protocol

• WordPress + php-fpm (it must be installed and configured) - without nginx.
 	php-fpm - (FastCGI Process Manager)
• MariaDB  -  without nginx.
• A volume that contains your WordPress database.
• A second volume that contains your WordPress website files.
• A docker-network that establishes the connection between your containers.
Your containers have to restart in case of a crash.

___________________________________________________________________________________________________________________________________________________________________________
___________________________________________________________________________________________________________________________________________________________________________

NOTES:
	-only users in the 'docker' user group have access to the Docker deamon socket. by default only sudo and docker are added, personal user might need to be added with [sudo usermod -aG docker $USER] then either relog into ubuntu, or run [newgrp docker] which will open a new terminal, in which the current user's primary group is the specified one. ie docker. (TEMP solution that will only last for the current terminal)





___________________________

NGINX container
___________________________

Dockerfile:
The container is based on Debian, the panultimate stable version is by default called OLDSTABLE.
then nginx and openssl need to be installed in order to run the nginx server.
A cerftificate needs to be installed in order to limit allowed security protocols(TLSv1.2, 1.3)
creating a folder for my SSL certificate and generating it:
	ssl command parameters explained:
		req - create certificates
		x509 - certificate type
		nodes - [no DES(Data Encryption Standard)] makes sure the private key wont be encrypted
		out - path for the certificate output
		keyout - path for the PRIVATE KEY
		subj - the SSL cert demands some info about the owner, openssl by default opens a dialog for the info but [docker build] wont run if prompted for info. this gives all that info within the command to not be prompted.

Rewriting the default NGINX config file to include my changes to the default server (using generated SSL cert, listening on port 443...)

copying my index.html to the nginx server.

EXPOSE:
	https://we-are.bookmyshow.com/understanding-expose-in-dockerfile-266938b6a33d
	https://www.baeldung.com/ops/docker-expose-vs-publish
	The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. EXPOSE does not make the ports of the container accessible to the host.
	when using RUN to run the image, the host port needs to be redirected to the 443 nginx port with [--publish/-p [host port]:[container port(443)]]

lastly, CMD runs nginx. the daemon off; directive tells Nginx to stay in the foreground.

SERVER CONFIGURATION:
the _server_conf file is not used, but the code in it was placed in nginx.conf which is actually copied into the container.

server{
	listen 443;											-> pretty self explanatory
	ssl_protocols TLSv1.2 TLSv1.3;						-> same. allow only these protocols.
	ssl_certificate /etc/nginx/ssl/inception.crt;		-> use the generated certificate
	ssl_certificate_key /etc/nginx/ssl/inception.key;	-> use the generated private key

	server_name localhost;								-> defines where to use the certificate.
	root /var/www/html;									-> root folder of the site.

	location ~ \.php$ { 								-> basically, the location of all PHP files
	include snippets/fastcgi-php.conf;					-> include fastcgi code
	fastcgi_pass wordpress:9000;						-> pass-redirect to- [HOST]:[PORT]. the 'wordpress' server on Port 9000,
															which is defined by the pdf for nginx-wp communication.
	}

}

//OTHER STUFF

$>	docker build . -t [myimg]
$>	docker run -d --rm  -p 443:443 --name nginx_cont myimg:latest
	-d: detach from shell, run in background
	--rm: delete after closing
	-p: publish, redirect host port 443 to container port 443
	--name: give usable name instead of id
//curl
	-k: my certificate is self signed, is not trusted. -k skips certification validation
	-I --head: fetch headers only
	-v --verbose
	--tlsvX.X : minimum tls version
	--tls-max : maximum tls version
$>	curl -k -I -v --tlsv1.2 --tls-max 1.3 https://localhost:443 //should work
$>	curl -k -I -v --tlsv1 --tls-max 1.1 https://localhost:443 //should NOT work

_________________________________________________________________________________________________________________
_________________________________________________________________________________________________________________

To connect NGINX to Wordpress:
nginx can't process php requests - which wordpress uses. FastCGI()

	FASTCGI----------------------------------------------------------------------------------------------
	|	https://www.reddit.com/r/webdev/comments/ulvk8/can_anyone_explain_like_i_am_5_what_is_fastcgi/	|
	|	In a nutshell, both CGI (Common Gateway Interface) and FastCGI just describe how to pass		|
	|	a bunch of values - such as HTTP headers, the request body and client input — to the			|
	|	server-side part of your website.																|
	-----------------------------------------------------------------------------------------------------

the subject says Wordpress needs to use PHP-FPM.
https://medium.com/@miladev95/cgi-vs-fastcgi-vs-php-fpm-afbc5a886d6d

	PHP-FPM----------------------------------------------------------------------------------------------
	|	PHP-FPM (FastCGI Process Manager) is an alternative to FastCGI implementation of PHP with some	|
	|	additional features useful for sites with high traffic. It is the preferred method of processing|
	|	PHP pages with NGINX and is faster than traditional CGI based methods such as SUPHP or mod_php	|
	|	for running a PHP script.																		|
	-----------------------------------------------------------------------------------------------------


	To make sure PHP requests to nginx server get redirected to wordpress, this nginx directive needs to be added:

location ~ \.php$ { 					#basically, the location of all PHP files
	include snippets/fastcgi-php.conf;	#include fastcgi code
	fastcgi_pass wordpress:9000;		#pass-redirect to- [HOST]:[PORT]. the 'wordpress' server on Port 9000, which is defined by the pdf for nginx-wp communication.
	}
_________________________________________________________________________________________________________________
_________________________________________________________________________________________________________________
____________________

Wordpress Container
____________________

The guide I followed sets up MariaDB after Nginx, but ill give wordpress a go.
Right now nginx needs to know to redirect all php requests to the wordpress server, then the wordpress and nginx servers need to be connected through a bridge network.



####the solution to all my problems??
https://medium-parser-seven.vercel.app/?url=https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a