FROM debian:buster

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

# I need to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Copy the .conf in the html directory
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#Create the folder to enable php start
RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY ./tools/auto_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/auto_config.sh

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

CMD ["bash", "/usr/local/bin/auto_config.sh"]
