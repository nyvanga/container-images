# Apache

[Apache 2.4 on Debian](https://github.com/docker-library/httpd/tree/master/2.4) with some perl stuff and other useful bits and pieces.

To add configuration to Apache volume mount a site.conf file into /usr/local/apache2/conf/site.conf

## Test build

Run: ```docker-compose up --build```

Access with browser on: ```http://localhost:8080```

Includes demo of the [Gitlist](../gitlist) image.