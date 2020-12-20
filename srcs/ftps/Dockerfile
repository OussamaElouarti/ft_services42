FROM alpine

# update and install openrc
RUN apk update && apk add openrc libc6-compat bash
RUN openrc reboot

#install telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

#instal supervisor
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#install and config vsftpd
RUN apk add vsftpd
RUN adduser admin -D && echo "admin:123" |chpasswd
RUN mkdir -p /home/admin/ftp/upload
RUN chmod 550 /home/admin/ftp && chmod 750 /home/admin/ftp/upload && chown -R admin: /home/admin/ftp/
COPY srcs/vsftpd.conf /etc/vsftpd/
COPY srcs/ftps.pem /etc/ssl/

CMD ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]