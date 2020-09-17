# Webserver (apache + PHP FPM) images

## Apache
[Apache 2.4 on Debian](https://github.com/docker-library/httpd/tree/master/2.4) with some perl stuff and other useful bits and pieces.

Includes [GitList](http://gitlist.org) installed in /code, and PHP files are run by mod_fcgi with the PHP image.

To add configuration to Apache volume mount a site.conf file into /usr/local/apache2/conf/site.conf

## PHP

[PHP 7 FPM](https://github.com/docker-library/php/tree/master/7.4/alpine3.11/fpm) image with gitlist installed in /code.

## Test build

Run: ```docker-compose up --build```

Access: ```http://localhost:8080```

