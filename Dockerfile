FROM php:5.6-apache
  
RUN a2enmod headers
RUN a2enmod expires

ADD nanogp2/dist /var/www/html/
COPY config.php /var/www/html/admin/config.php
COPY robots.txt /var/www/html/
COPY index.html /var/www/html/
RUN chown -R www-data: /var/www/html

ENV NANOGP2_MAX_ACCOUNTS=1
ENV NANOGP2_CLIENT_ID="your_client_id"
ENV NANOGP2_CLIENT_SECRET="your_client_secret"
ENV NANOGP2_ALBUMS_FILTER=""

VOLUME [ "/var/www/html/admin/users" ]
WORKDIR /var/www/html
