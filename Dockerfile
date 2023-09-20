FROM php:8.2.8-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install dependencies 
RUN apt-get update && apt-get install -y \
     libfreetype6-dev \
     libjpeg62-turbo-dev \
     libpng-dev \
     libzip-dev \
     libicu-dev \
     default-mysql-client \
     unzip

# Clear php.ini  
RUN rm -rf /usr/local/etc/php/conf.d/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli exif pcntl bcmath gd zip intl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
#RUN mkdir -p /var/www/html

# Set permissions for www-data user
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html

# Change user to www-data
USER www-data

# Copy composer.json and writable directory
COPY --chown=www-data:www-data ./app/writable ./app/composer.json ./

# Install composer dependencies
#RUN composer install

EXPOSE 9000
