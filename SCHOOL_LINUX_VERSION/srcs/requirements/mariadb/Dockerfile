# This Dockerfile sets up a MariaDB container based on Debian Buster.

# Use the Debian Buster base image
FROM debian:buster

# Update package repository and install MariaDB server and client
RUN apt-get update && apt-get -y install mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Expose port 3306 for MySQL connections
EXPOSE 3306

# Copy custom MySQL configuration file and setup script
COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh

# Make the setup script executable
RUN chmod +x /usr/local/bin/mariadb_setup.sh

# Set the entry point to the setup script
ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]
