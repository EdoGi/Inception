#!/bin/bash

#check if wp-config.php exist
sleep 10
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
wp core install     --url='http://egiacomi.42.fr' \
                    --title='Inception42' \
                    --admin_user='egiacomi_adm' \
                    --admin_password='mdpdifficile123' \
                    --admin_email='egiacomi@student.42.fr'
wp config create    --allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'                    
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F