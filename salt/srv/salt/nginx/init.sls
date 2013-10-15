nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d
      - file: /etc/nginx/sites-enabled

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf

/etc/nginx/conf.d:
  file.recurse:
    - source: salt://nginx/files/conf.d

/etc/nginx/sites-enabled:
  file.recurse:
    - source: salt://nginx/files/sites-enabled
