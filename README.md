Docker Drupal PHPFarm
=====================

This creates a Docker container for developing a Drupal 7 site.

Using [PHPFarm](https://github.com/eugenesia/docker-phpfarm) means you can use
multiple PHP versions for the site - good for developing multiple client sites
running different PHP versions on their servers.

If using PHP 5.1 or 5.2, use Dockerfile-wheezy.

If using PHP 5.3 and above, use Dockerfile-jessie for a more modern Debian
version in the container.

