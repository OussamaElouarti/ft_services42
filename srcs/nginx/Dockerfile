FROM alpine 

RUN apk update && apk add nginx openssh libc6-compat bash sudo
RUN adduser -g 'Nginx www user' --disabled-password -h /home/www/ oel-ouar && echo "oel-ouar:oel-ouar" | chpasswd && chown -R oel-ouar:oel-ouar /home/ && chown -R oel-ouar:oel-ouar /var/lib/nginx
RUN echo "it's working" > /home/www/index.html
RUN echo "%oel-ouar ALL=(ALL) ALL" >>/etc/sudoers
RUN mkdir /etc/nginx/ssl
COPY srcs/nginx.key /etc/nginx/ssl
COPY srcs/nginx.crt /etc/nginx/ssl
COPY srcs/default.conf /etc/nginx/conf.d/
RUN apk add --no-cache supervisor
COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.3_linux_amd64.tar.gz  
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN mkdir /run/nginx/
RUN apk add openrc
RUN openrc reboot
RUN ssh-keygen -A
RUN echo "oel-ouar:root" | chpasswd
EXPOSE 80 443 22
CMD  ["/usr/bin/supervisord" , "-c", "/etc/supervisor/conf.d/supervisord.conf"]