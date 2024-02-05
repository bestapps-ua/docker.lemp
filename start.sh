#!/bin/sh
#mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_orig
#mv /etc/nginx/custom.conf /etc/nginx/sites-available/default

echo "Starting the nginx daemon"
service nginx start

echo "Starting the mysql daemon"

service mysql stop
usermod -d /var/lib/mysql/ mysql
service mysql start

echo "Starting the php 8.2 daemon"
service php8.2-fpm start
