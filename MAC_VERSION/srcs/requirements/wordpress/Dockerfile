# Dockerfile for setting up a WordPress environment with PHP and MariaDB on Debian Buster

# Use the Debian Buster base image
FROM debian:buster

# Update package repository and install necessary programs
RUN apt-get update && apt-get -y install \
    wget \
    curl \
    bash \
    php7.3 \
    php-cgi \
    php-mysql \
    php-mysqli \
    php-fpm \
    php-pdo \
    php-gd php-cli \
    php-mbstring \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Install wp_cli command and place it in /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and extract WordPress files
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Create directory for PHP-FPM
RUN mkdir /run/php

# Copy auto_config.sh script and make it executable
COPY ./tools/auto_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/auto_config.sh

# Set working directory to /var/www/html/
WORKDIR /var/www/html/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start the auto_config.sh script
CMD ["bash", "/usr/local/bin/auto_config.sh"]
