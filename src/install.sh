#!/bin/sh

cp greenit.conf /etc/nginx/sites-enabled
cp greenit_scgi_params /etc/nginx/sites-enabled

cp greenit.service /etc/systemd/system
systemctl start greenit
systemctl enable greenit
echo "all done. Just restart nginx. BE SURE TO COPY THE PIKE SCRIPTRUNNER SCGI SCRIPT!"