# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget mariadb-client php7.3 php-fpm php-mysql

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

# COPY conf/php.ini /etc/php/7.3/fpm/
COPY	./conf/php.conf			/etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# RUN chmod +x /usr/local/bin/auto-config.sh \
# RUN mkdir /run/php

COPY tools/auto-config.sh auto-config.sh

ENTRYPOINT ["bash", "auto-config.sh"]
# WORKDIR /var/www/html/

EXPOSE 9000

# CMD ["/usr/sbin/php-fpm7.3", "-F"]
