#!/bin/bash
read -p "Enter External URL: " extURL
read -p "Enter Internal URL: " intURL
cp /etc/nginx/conf.d/temp.sample_conf /etc/nginx/conf.d/$extURL.conf
sed -i s/{{extURL}}/$extURL/g /etc/nginx/conf.d/$extURL.conf
nginx -s reload
certbot certonly --webroot --agree-tos --email $email -n -d $extURL -w /usr/share/nginx/html/
rm /etc/nginx/conf.d/$extURL.conf
cp /etc/nginx/conf.d/template.sample_conf /etc/nginx/conf.d/$extURL.conf
sed -i s/{{extURL}}/$extURL/g /etc/nginx/conf.d/$extURL.conf
sed -i s/{{intURL}}/$intURL/g /etc/nginx/conf.d/$extURL.conf
nginx -s reload