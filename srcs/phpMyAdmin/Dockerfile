FROM alpine 

RUN apk update && apk add nginx libc6-compat bash 
RUN adduser -g 'Nginx www user' --disabled-password -h /home/www/ oel-ouar && echo "oel-ouar:oel-ouar" | chpasswd && chown -R oel-ouar:oel-ouar /home/www && chown -R oel-ouar:oel-ouar /var/lib/nginx
COPY srcs/default.conf /etc/nginx/conf.d/
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN apk add php7-fpm php7-mcrypt php-mbstring php7-soap php7-session php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN apk add openrc
RUN openrc reboot
RUN apk add wget
RUN mkdir /run/nginx/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
RUN unzip phpMyAdmin-5.0.4-all-languages.zip
RUN rm phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages/ /home/www/
COPY /srcs/config.inc.php /home/www/phpMyAdmin-5.0.4-all-languages
RUN mkdir /home/www/phpMyAdmin-5.0.4-all-languages/tmp && chmod 777 /home/www/phpMyAdmin-5.0.4-all-languages/tmp
CMD ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"] 