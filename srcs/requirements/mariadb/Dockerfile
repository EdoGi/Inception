# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt update -y && apt upgrade -y \
    && apt-get install -y mariadb-server
    # && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

# COPY conf/myserver.cnf /etc/mysql/mariadb.conf.d/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_setup.sh /mariadb_setup.sh

ENTRYPOINT [ "bash", "mariadb_setup.sh" ]

EXPOSE 3306