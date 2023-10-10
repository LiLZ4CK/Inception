FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get -y install wget

RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    mariadb-client

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR  /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY requirements/wordpress/conf/wp-config-create.sh .

RUN chmod 777 wp-config-create.sh

CMD ["sh", "wp-config-create.sh"]
