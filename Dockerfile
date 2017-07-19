# From https://www.drupal.org/requirements/php#drupalversions
# Based on Dockerfile for drupal:7-apache https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile
FROM eugenesia/phpfarm:jessie

MAINTAINER Eugene Sia <eugene@eugenesia.co.uk>
LABEL maintainer="Eugene Sia <eugene@eugenesia.co.uk>" \
  description="PHP5/Apache environment suitable for developing a Drupal 7 site."

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y \
    # For drupal_http_request() to reach SSL sites.
    ca-certificates \
    libpng12-dev \
    libjpeg-dev \
    libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install \
    gd \
    mbstring 
    opcache \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    zip \
  # Install XHProf PECL extension for perf profiling.
  && pecl install xhprof-beta \
  && docker-php-ext-enable xhprof

# Configure PHP.
COPY php.ini /usr/local/etc/php/

