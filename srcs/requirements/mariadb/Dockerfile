# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt update -y && apt upgrade -y \
    && apt-get install -y mariadb-server mariadb-client
    # && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld \
&& chmod 777 /run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/mariadb_setup.sh /mariadb_setup.sh

ENTRYPOINT [ "bash", "mariadb_setup.sh" ]

EXPOSE 3306