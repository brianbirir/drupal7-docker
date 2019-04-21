FROM php:7.2-fpm

RUN apt-get update; \
    apt-get upgrade; \	
    apt-get install -y --no-install-recommends \
    	libjpeg-dev \
	libpng-dev \
	libpq-dev; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install -j "$(nproc)" \
    	gd \
	opcache \
	pdo_mysql \
	pdo_pgsql \
	zip \
        mbstring;

WORKDIR /var/www/web

COPY ./web/ /var/www/web

RUN chown -R www-data:www-data sites modules themes