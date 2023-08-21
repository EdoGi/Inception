#!/bin/bash

# Script Purpose: Set up and configure WordPress and start PHP-FPM.

# Sleep for 10 seconds (potentially to allow other services to start)
sleep 10

# Check if wp-config.php file doesn't exist in WordPress directory
if [ ! -e /var/www/html/wordpress/wp-config.php ]; then
    # Create WordPress configuration
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
                     --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

    # Sleep for 2 seconds
    sleep 2
    
    # Install WordPress core
    wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD \
                     --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/html/wordpress'
    
    # Create a new user with 'author' role
    wp user create --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS \
                   --path='/var/www/html/wordpress' >> /log.txt
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F
