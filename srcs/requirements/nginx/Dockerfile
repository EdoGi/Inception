FROM	debian:buster

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl \
				vim \
				curl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=egiacomi/CN=egiacomi/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

# FROM debian:buster

# RUN apt update && apt upgrade -y \
#     && apt-get install -y nginx \
#     openssl
#     # && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /etc/nginx/ssl \
#     mkdir -p /var/run/nginx

# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#     -out /etc/nginx/ssl/inception.crt \
#     -keyout /etc/nginx/ssl/inception.key \
#     -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=egiacomi.42.fr/UID=egiacomi"

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# # COPY ./conf/nginx.conf /etc/nginx/conf.d

# RUN chmod 755 /var/www/html \
#     && chown -R www-data:www-data /var/www/html 

# EXPOSE 443

# CMD [ "nginx", "-g", "daemon off;" ]
