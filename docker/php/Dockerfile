FROM composer:2.4.2 as composer

##################################

FROM php:8.2-fpm as base-php

RUN apt-get update \
    && apt-get install -y \
            zlib1g-dev \
            libzip-dev \
    && docker-php-ext-install -j"$(nproc)" pdo_mysql

RUN docker-php-ext-install zip

RUN pecl install apcu-5.1.22
RUN docker-php-ext-enable apcu

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /usr/src/app

ARG APP_FOLDER

RUN mkdir /.composer && chown 1000 /.composer

COPY apps/back /usr/src/app

RUN mkdir -p /usr/src/app/var/cache /usr/src/app/var/log
RUN chmod -R a+w /usr/src/app/var/cache /usr/src/app/var/log

COPY . /usr/src/app

RUN chown -R 1000:1000 /usr/src/app
USER 1000:1000

##################################

FROM base-php as php

RUN composer install && composer clear-cache
RUN composer dump-autoload --optimize --classmap-authoritative --no-dev

RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin

##################################

FROM base-php as composer-install