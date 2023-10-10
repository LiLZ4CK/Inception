FROM debian:bullseye

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apt-get update && apt-get install -y mariadb-server

COPY requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY requirements/mariadb/conf/script.sh .

ENTRYPOINT ["sh", "./script.sh"]
