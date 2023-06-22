nginx 
while [ 1 -eq 1 ]
do
    echo Started running at `date`
    certbot renew
    nginx -s reload
    echo Finished running at `date`
    sleep 86400
done