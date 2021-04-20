FROM php:7.3-apache 

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite

RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install mysqli
COPY ./www/composer.json  /var/www/html/
RUN composer install