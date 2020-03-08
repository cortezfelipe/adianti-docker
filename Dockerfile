FROM php:7.3-apache 

RUN a2enmod rewrite

RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install mysqli

