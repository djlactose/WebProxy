FROM nginx

EXPOSE 80
EXPOSE 443

ENV email=nobody@someplace.com

COPY template.sample_conf /root/bin/
COPY temp.sample_conf /root/bin/
COPY add.sh /root/bin/
COPY run.sh /root/bin/

VOLUME /etc/nginx/conf.d/
VOLUME /etc/letsencrypt/

RUN apt update && \
apt install -y certbot && \
rm /etc/nginx/conf.d/default.conf && \
chmod +x /root/bin/add.sh

WORKDIR /root/bin

HEALTHCHECK CMD curl --fail http://localhost || exit 1

ENTRYPOINT /root/bin/run.sh