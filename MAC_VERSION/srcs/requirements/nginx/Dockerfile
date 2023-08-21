# Dockerfile for setting up an Nginx server with SSL on Debian Buster

# Use the Debian Buster base image
FROM debian:buster

# Update package repository and install necessary programs
RUN apt-get update && apt-get install -y nginx openssl vim curl

# Create directories and generate SSL certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=egiacomi/CN=egiacomi/"

# Copy custom Nginx configuration
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Create directory for Nginx
RUN mkdir -p /run/nginx

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
