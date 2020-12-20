FROM alpine

RUN apk update && apk add libc6-compat bash wget 
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN tar -zxvf grafana-7.3.2.linux-amd64.tar.gz
COPY srcs/grafana.db /grafana-7.3.2/data/grafana.db
CMD  ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]