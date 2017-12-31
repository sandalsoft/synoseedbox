#!/bin/bash

set -x

chown -R www-data:www-data /var/www/rutorrent
mkdir -p /rutorrent/torrents
chown -R www-data:www-data /rutorrent/
rm -f /etc/nginx/sites-enabled/*
cp /root/rutorrent-basic.nginx /etc/nginx/sites-enabled/

nginx -g "daemon off;"
