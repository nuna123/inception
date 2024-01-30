INCEPTION - Documentation
hopefully to help me understand what to

-------------------------------------------------------------------------------------------
	Docker tutorial, goes over basic docker commands, terminology, images and dockefiles
		https://docker-curriculum.com/

	Containers vs VMs: What's the difference?
	IBM Technology
		https://www.youtube.com/watch?v=cjXI-yxqGTI
-------------------------------------------------------------------------------------------

**Docker**
	Supplies containers  - an environment to run applications in, that is mostly isolated from the host and other containers.
	Containes the application and its dependencies only!
!!!!!NOTE:
	only users in the 'docker' user group have permissions to the Docker deamon socket. by default only sudo and docker are added, personal user might need to be added with [sudo usermod -aG docker $USER] then relog into ubuntu.


*VMS vs DOCKER:*
	VMS: virtualize the OS Kernel and applications layer
		boot their own OS with each instance.
		completely isolated from eachother - HARDWARE ISOLATION.
		VM of any OS can run on any OS host
	Docker:
		only virtualize the Applications layer - makes Docker more lightweight and faster to boot and run.

*Dictionary:*
		Dockerfiles:
				basically a makefile for creating Docker Images.
				Dockerfile ref: https://docs.docker.com/engine/reference/builder/
		Docker Image:
			A Docker image a template that contains everything needed to run an application - application code, dependencies, and any system libraries or configuration files. Images are created from a Dockerfile.
		Docker Container:
			A Docker container is a running instance of a Docker image. isolated environments that run an application with their own isolated file system and resources. Containers are created from Docker images, and multiple containers can run from the same image.
		Docker Volume:
			A Docker volume is a persistent data storage area that can be used by one or more containers. Volumes are used to store data that needs to persist beyond the life of a container, such as application configuration files or user data.
			They can be backed up easily since theyre just a folder.

*docker-compose.yml:*
	A docker-compose.yml is a config file for Docker Compose.
	Docker-compose allows to configure and run multiple containers at the same time, as well as managing their network, volumes, initiation order etc.



**The containers**
	• NGINX with TLSv1.2 or TLSv1.3 only.
		Nginx is a webserver which stores hmtl, js, images files and use http request to display a website. Nginx conf documents will be used to config our server and the right proxy connexion.
		TLS - Transport Layer Security protocol
	• WordPress + php-fpm (it must be installed and configured) - without nginx.
		php-fpm - (FastCGI Process Manager) - since NGINX doesnt use PHP, Fastcgi is used to connect it with wordpress.
	• MariaDB  -  without nginx.
		A sql based database solution.
	• A volume that contains your WordPress database.
		mysql database which backs up the actual mysql files and gets mounted to the mariadb container.
		Doesnt get mounted to wordpress container since wp access the database through requests and not directly manages the files.
	• A second volume that contains your WordPress website files.
		all the wordpress files, will be mounted both on nginx and wordpress containers so they can both access the wordpress files
	• A docker-network that establishes the connection between your containers.
		a bridge network - which lets containers connected to the same bridge network communicate, while providing isolation from containers that aren't connected to that bridge network.

