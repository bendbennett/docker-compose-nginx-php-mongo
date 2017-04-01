FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
    libssl-dev pkg-config

RUN pecl install -o -f mongodb \
    && rm -rf /tmp/pear \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb.ini

RUN rm /usr/local/etc/php-fpm.d/www.conf

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

CMD ["php-fpm", "-FR"]
