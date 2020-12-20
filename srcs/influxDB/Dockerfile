FROM alpine

RUN apk update && apk add libc6-compat bash influxdb
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz
RUN mkdir -p /etc/telegraf\
&& mkdir  /var/lib/influxdb\
&& mkdir   /etc/influxdb
COPY srcs/influxdb.conf /etc/influxdb
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
CMD ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]