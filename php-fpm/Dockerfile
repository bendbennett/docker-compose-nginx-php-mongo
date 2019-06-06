FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
    libssl-dev pkg-config

RUN pecl install -o -f mongodb

RUN docker-php-ext-enable mongodb

RUN rm /usr/local/etc/php-fpm.d/www.conf

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

CMD ["php-fpm", "-FR"]
