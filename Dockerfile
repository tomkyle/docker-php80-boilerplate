FROM php:8.0-apache

RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod autoindex
RUN a2enmod deflate
RUN a2enmod expires
RUN a2enmod headers
RUN a2enmod include
RUN a2enmod mime
RUN a2enmod setenvif

RUN mkdir -p /etc/apache2/ssl
COPY ./*.pem /etc/apache2/ssl/
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443
