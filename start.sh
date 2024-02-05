#!/bin/sh
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_orig
mv /etc/nginx/custom.conf /etc/nginx/nginx.conf

echo "Starting the nginx daemon"
service nginx start

echo "Starting the mysql daemon"

service mysql stop
usermod -d /var/lib/mysql/ mysql
service mysql start

echo "Starting the php 8.2 daemon"
service php8.2-fpm start
