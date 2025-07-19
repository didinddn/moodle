# Use Ubuntu latest as the base image
FROM ubuntu:latest

# Install Nginx, PHP-FPM, and necessary PHP extensions
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nginx \
    nano \
    php8.3-fpm \
    php-mysql \
    php-pgsql \
    php-iconv \
    php-ctype \
    php-json \
    php-curl \
    php-zip \
    php-simplexml \
    php-dom \
    php-xml \
    php-gd \
    php-mbstring \
    php-intl \
    php-soap \
    supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure Nginx and PHP-FPM
RUN mkdir -p /run/php && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy Nginx and PHP-FPM configurations
COPY default /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/nginx.conf
COPY php.ini /etc/php/8.3/fpm/php.ini
COPY www.conf /etc/php/8.3/fpm/pool.d/www.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY smkn2jember.sch.id.key /etc/ssl/certs/
COPY smkn2jember.sch.id_ssl-bundle.crt /etc/ssl/certs/

# Create web root directory
#RUN mkdir -p /var/www/html

# Copy your application files (optional, volume will override)
COPY index.php /var/www/html/

# Expose port 80
EXPOSE 80 443

# Volume for application files (maps to host machine)
VOLUME /var/www/html

# Start Supervisor (which manages Nginx & PHP-FPM)
CMD ["/usr/bin/supervisord", "-n"]
