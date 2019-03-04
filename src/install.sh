#!/bin/sh

cp greenit.conf /etc/nginx/sites-enabled
cp greenit_scgi_params /etc/nginx/sites-enabled
echo "all done. Just restart nginx"