#!/bin/bash

# This script sets up MySQL database and user privileges.

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else

# Create an SQL script for initializing the database
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" > /tmp/db_init.sql

# Alter root user password and grant privileges
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/db_init.sql
echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> /tmp/db_init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/db_init.sql

# Create a user and grant privileges for the specified database
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /tmp/db_init.sql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /tmp/db_init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> /tmp/db_init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/db_init.sql

# Start MySQL service
service mysql start

# Run the SQL script to initialize the database and set up privileges
mysql -u root -p$MYSQL_ROOT_PASSWORD < /tmp/db_init.sql

fi

# Shutdown MySQL after setup
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Clean up temporary SQL script
rm -rf /tmp/db_init.sql

# Start MySQL server safely
exec mysqld_safe
