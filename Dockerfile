FROM php:7.4-rc-fpm-alpine

<<<<<<< HEAD
LABEL Organization="CTFTraining" Author="Virink <virink@outlook.com>"
=======
LABEL Organization="CTFHUB" Author="Virink <virink@outlook.com>"
>>>>>>> 5e284c2... Update Base Image and Optimize

COPY _files /tmp/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache tar nginx mysql mysql-client \
    && mkdir /run/nginx \
    # mysql ext
    && docker-php-source extract \
    && docker-php-ext-install mysqli pdo_mysql \
    && docker-php-source delete \
    # init mysql
    && mysql_install_db --user=mysql --datadir=/var/lib/mysql \
    && sh -c 'mysqld_safe &' \
    && sleep 5s \
<<<<<<< HEAD
    && mysqladmin -uroot password 'root' \
    # && mysql -e "source /var/www/html/db.sql;" -uroot -proot \
=======
    && mysqladmin -h '127.0.0.1' -uroot password 'root' \
    && mysql -h '127.0.0.1' -uroot -proot -e "create user ping@'%' identified by 'ping';" \
>>>>>>> 5e284c2... Update Base Image and Optimize
    # configure file
    && mv /tmp/flag.sh /flag.sh \
    && mv /tmp/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint \
    && chmod +x /usr/local/bin/docker-php-entrypoint \
    && mv /tmp/nginx.conf /etc/nginx/nginx.conf \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && chown -R www-data:www-data /var/www/html \
    # clear
    && rm -rf /tmp/*

WORKDIR /var/www/html

EXPOSE 80

VOLUME ["/var/log/nginx"]

CMD ["/bin/bash", "-c", "docker-php-entrypoint"]