# Base Image LNMP

- L: Linux alpine
- N: Nginx
- M: MySQL
- P: PHP 7.4
- PHP MySQL Ext
    + mysql
    + mysqli

## Usage

### ENV

<<<<<<< HEAD
- FLAG=CTFTraining{nginx_mysql_php_74}
=======
- FLAG=ctfhub{nginx_mysql_php_74}
>>>>>>> 5e284c2... Update Base Image and Optimize

You should rewrite flag.sh when you use this image.
The `$FLAG` is not mandatory, but i hope you use it!

### Files

- src 网站源码
    + db.sql **The file can aotu import to database!**
    + index.php
    + ...etc
- Dockerfile
- docker-compose.yml
<<<<<<< HEAD
=======

#### db.sql

You should create database and user!

```sql
DROP DATABASE IF EXISTS `ctfhub`;
CREATE DATABASE ctfhub;
GRANT SELECT,INSERT,UPDATE,DELETE on ctfhub.* to ctfhub@'127.0.0.1' identified by 'ctfhub';
GRANT SELECT,INSERT,UPDATE,DELETE on ctfhub.* to ctfhub@localhost identified by 'ctfhub';
use ctfhub;

-- create table...
```
>>>>>>> 5e284c2... Update Base Image and Optimize

### Dockerfile

```
<<<<<<< HEAD
FROM ctftraining/base_image_nginx_mysql_php_74

COPY src /var/www/html
COPY flag.sh /flag.sh
=======
FROM ctfhub/base_web_nginx_mysql_php_74

COPY src /var/www/html
COPY _files/flag.sh /flag.sh
>>>>>>> 5e284c2... Update Base Image and Optimize
```

