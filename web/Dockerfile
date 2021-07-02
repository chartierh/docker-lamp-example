# Image de base
FROM debian:stable

# Installation paquets et prérequis
RUN apt update \
&& apt install -y apache2 unzip curl \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb /var/www/html/*

# Configuration apache
RUN a2dissite 000-default.conf && a2enmod rewrite proxy proxy_fcgi proxy_http \
&& service apache2 stop
RUN rm /etc/apache2/sites-available/*
COPY virtualhost.conf /etc/apache2/sites-available/www.conf
RUN a2ensite www.conf && service apache2 start

# Ce que l'on expose en dehors du container
EXPOSE 80
VOLUME /var/www/web

# Ajout du script start.sh (qui démarrera apache2 et sera notre entrypoint du container)
COPY start.sh /bootstrap/start.sh
RUN chmod 755 /bootstrap/start.sh && chown -R www-data:www-data /var/www && chmod -R 775 /var/www
ENTRYPOINT ["/bootstrap/start.sh"]
