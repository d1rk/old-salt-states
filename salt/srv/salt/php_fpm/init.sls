# PHP5 modules and configuration
php_stack:
  pkg.installed:
    - name: php5-fpm
  service.running:
    - name: php5-fpm
    - pkgs:
      - php-pear
      - php5-common
      - php5-gd
      # - php5-apc
      - php5-mysql
      - php5-mongo
      - php5-redis
      # - php5-suhosin
      - php5-memcache
      - php5-mcrypt
      - php5-curl
      - php5-cli
      - mysql-client
    - watch:
      - file: /etc/php5/fpm/php.ini
      - file: /etc/php5/fpm/php-fpm.conf
      - file: /etc/php5/fpm/pool.d

php_modules:
  pkg.installed:
    - pkgs:
      - php-pear
      - php5-common
      - php5-gd
      # - php5-apc
      - php5-mysql
      - php5-mongo
      - php5-redis
      # - php5-suhosin
      - php5-memcache
      - php5-mcrypt
      - php5-curl
      - php5-cli
      - mysql-client

/etc/php5/cli/php.ini:
  file.managed:
    - source: salt://php_fpm/files/cli/php.ini
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/php.ini:
  file.managed:
    - source: salt://php_fpm/files/fpm/php.ini
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/php-fpm.conf:
  file.managed:
    - source: salt://php_fpm/files/fpm/php-fpm.conf
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/pool.d:
  file.recurse:
    - user: root
    - group: root
    - source: salt://php_fpm/files/fpm/pool.d

/etc/php5/mods-available:
  file.recurse:
    - user: root
    - group: root
    - source: salt://php_fpm/files/mods-available


# /etc/php5/fpm/conf.d:
#   file.recurse:
#     - user: root
#     - group: root
#     - source: salt://php_fpm/files/conf.d

# /etc/php5/cli/conf.d:
#   file.recurse:
#     - user: root
#     - group: root
#     - source: salt://php_fpm/files/conf.d

# Configuration files for php5-fpm

# /etc/php5/fpm/pool.d/www.conf:
#   file.managed:
#     - source: salt://php_fpm/files/www.conf
#     - user: root
#     - group: root
#     - mode: 644

# /etc/php5/fpm/conf.d/apc.ini:
#   file.managed:
#     - source: salt://php_fpm/files/apc.ini
#     - user: root
#     - group: root
#     - mode: 644

