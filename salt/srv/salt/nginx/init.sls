nginx_configtest:
  module.wait:
    - name: nginx.configtest
    - watch:
      - file: /etc/nginx/nginx.conf
      - pkg: nginx

nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - restart: True
    # - require:
    #   - pkg: nginx
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d
      - file: /etc/nginx/sites-enabled
      - module.run: nginx_configtest

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf

/etc/nginx/conf.d:
  file.recurse:
    - source: salt://nginx/files/conf.d

/etc/nginx/sites-enabled:
  file.recurse:
    - source: salt://nginx/files/sites-enabled
