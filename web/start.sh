#!/bin/bash
source /etc/apache2/envvars
if [ -z "$(ls -A /var/www/html/wordpress)" ]; then
   echo "Site web non installé"
   curl -s -u $HTTP_SRC_LOGIN:$HTTP_SRC_PWD $HTTP_SRC_WWW > /dev/null
   curl -s -u $HTTP_SRC_LOGIN:$HTTP_SRC_PWD $HTTP_SRC_DB > /dev/null
   unzip /var/www/src/*.zip -d /var/www/html/
   sed -i 's/10.76.1.72/'$HOST_IP'/g' /var/www/src/*.sql
   sed -i 's/10.176.128.142/'$HOST_IP'/g' /var/www/src/*.sql
   #rm /var/www/src/*
   sed -i 's/localhost/db/g' /var/www/html/*/wp-config.php
   rm /var/www/html/*/.htaccess

else
   echo "Site web déjà installé"
fi
exec apache2 -D FOREGROUND
