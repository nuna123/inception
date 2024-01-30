**NGINX:**

	A popular web server.

**Needs to be done:**
	• Generate SSL certificates, without them TLS can't be used and the connection ont be secure.
		• • NOTE! because the certificates are self signed the browser will still give a warning.
	• config server to use TLS1.2 or 1.3 only,
		listen on port 443,
		config fastCGI to send requests to wordpress container.


**Dockerfile:**
	• install nginx and openssl
	• generate the certificates into/etc/nginx/ssl/
			ssl command parameters explained:
				req - create certificates
				x509 - certificate type
				nodes - [no DES(Data Encryption Standard)] makes sure the private key wont be encrypted
				out - path for the certificate output
				keyout - path for the PRIVATE KEY
				subj - the SSL cert demands some info about the owner, openssl by default opens a dialog for the info but [docker build] wont run if prompted for info. this gives all that info within the command to not be prompted.
	• copy nginx server config.
	• copy and set up entrypoint script, which only echoes a message to get some output
	• expose 443 for user.

**./conf/mynginxserver.conf**
	• listen on 443
	• use generated ssl certificates
	• set up TLS 1.2 and TLS1.3 only
	• set up the location of php files, which should be handled by fastcgi and requested from wordpress container



FOR TESTING TLS version:
		$>	curl -k -I -v --tlsv1.2 --tls-max 1.3 https://localhost:443 //should work
		$>	curl -k -I -v --tlsv1 --tls-max 1.1 https://localhost:443 //should NOT work