FROM php:7.4-apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update
RUN apt-get install -y \
      curl \
      git \
      cron \
      vim \
      unzip \
      rsyslog \
      supervisor \
      libjpeg-dev \
      libxml2-dev \
      libicu-dev \
      zlib1g-dev \
      libpng-dev \
      libonig-dev \
      libzip-dev

RUN docker-php-ext-install bcmath gd mbstring mysqli pdo pdo_mysql soap zip

COPY ./sites.conf /etc/apache2/sites-available/sites.conf

RUN a2enmod rewrite

EXPOSE 80
