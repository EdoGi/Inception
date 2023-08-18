FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh
RUN chmod +x /usr/local/bin/mariadb_setup.sh

ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]