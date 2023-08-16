#!/bin/sh

#start my sql service
service mysql start;

mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

# create a database (if the database does not exist)
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# create an user with a password (if the user does not exist)
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# give all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#modify sql database
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#reload the database
mysql -e "FLUSH PRIVILEGES;"

#shutdown
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

#use exec to 
exec mysqld_safe