# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt update && apt upgrade -y \
    && apt-get install -y nginx \
    openssl
    # && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl \
    mkdir -p /var/run/nginx

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=egiacomi.42.fr/UID=egiacomi"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html 

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]