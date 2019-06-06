FROM composer:1.8

# Install packages required for installing mogodb extenzion
RUN apk add --no-cache \
		$PHPIZE_DEPS \
		openssl-dev

# Install and link MongoDB extension
RUN pecl install mongodb

RUN docker-php-ext-enable mongodb

CMD ["composer"]
