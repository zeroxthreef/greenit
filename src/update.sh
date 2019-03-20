#!/bin/sh

cp -R html /var/www/greenit
chown -R www-data:www-data /var/www/greenit
service greenit restart
echo "all done."