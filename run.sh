if [ ! -f /etc/nginx/conf.d/default.conf ]
then
    cp /root/bin/temp.sample_conf /etc/nginx/conf.d/default.conf
    sed -i s/{{extURL}}/localhost/g /etc/nginx/conf.d/default.conf
fi
nginx 
while [ 1 -eq 1 ]
do
    echo Started running at `date`
    certbot renew
    nginx -s reload
    echo Finished running at `date`
    sleep 86400
done