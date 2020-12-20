#!/bin/bash

/etc/init.d/mariadb setup && /etc/init.d/mariadb start
 
echo "CREATE DATABASE wp_db;" | mysql -u root 
echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'%' IDENTIFIED BY '123';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY '123';" | mysql -u root
mariadb < /home/create_tables.sql
mariadb < /home/wp_db.sql
/etc/init.d/mariadb stop

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf