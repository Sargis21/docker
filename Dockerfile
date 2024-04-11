FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libzip-dev \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++

WORKDIR /var/www

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug-3.2.1 \
	&& docker-php-ext-enable xdebug

COPY etc/* $PHP_INI_DIR/conf.d/


