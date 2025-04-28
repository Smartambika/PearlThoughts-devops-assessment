FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql zip

WORKDIR /var/www/html

COPY . .

RUN curl -sS https://getcomposer.org/installer | php && \
    php composer.phar install

EXPOSE 9000

CMD ["php-fpm"]
