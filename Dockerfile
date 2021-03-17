FROM nginx

EXPOSE 80
EXPOSE 443

ENV email=nobody@someplace.com

COPY template.sample_conf /etc/nginx/conf.d/
COPY add.sh /root/bin/

VOLUME /etc/nginx/conf.d/
VOLUME /etc/letsencrypt/

RUN apt update && \
apt install -y certbot