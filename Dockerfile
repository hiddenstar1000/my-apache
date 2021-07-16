FROM php:7.4-apache
COPY ./sites-available/sites.conf /etc/apache2/sites-available/000-default.conf
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

RUN a2enmod rewrite

EXPOSE 80
