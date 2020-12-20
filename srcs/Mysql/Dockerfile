FROM alpine

RUN apk update && apk add openrc mariadb mariadb-common mariadb-client libc6-compat bash wget
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN openrc reboot
COPY srcs/mariadb-server.cnf /etc/my.cnf.d
COPY srcs/create_tables.sql /home/
COPY srcs/wp_db.sql /home/
COPY /srcs/start.sh .
CMD  sh start.sh