# Use a PHP base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY website /var/www/html

# Install PHP extensions and dependencies
RUN apt-get update \
    && apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libpq-dev \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        gd

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80 for the Apache web server
EXPOSE 80

# Start the Apache web server
CMD ["apache2-foreground"]