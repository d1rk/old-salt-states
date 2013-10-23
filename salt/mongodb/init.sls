mongodb-10gen:
  pkg:
    - name: mongodb-10gen
    - installed
  service:
    - name: mongodb
    - running
    - enable: True
    - reload: True
    - watch:
      - pkg: mongodb-10gen
    - require:
      - pkg: mongodb-10gen
  pkgrepo.managed:
    {% if grains['os'] == 'Debian' %}
    - name: deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen
    {% elif grains['os'] == 'Ubuntu' %}
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    {% endif %}
    - dist: dist
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-10gen


# mongodb:
#   service:
#     - running
#     - enable: True
#     - require:
#       - pkg: mongodb-10gen
#       - file: /etc/mongodb.conf
#       - file: /var/log/mongodb

mongo-dirs:
  file:
    - directory
    - user: mongodb
    - group: mongodb
    - mode: 755
    - makedirs: True
    - names:
      - /var/log/mongodb
      - /usr/libexec/mongo
    - require:
      - pkg: mongodb-10gen

# /etc/mongodb.conf:
#   file:
#     - managed
#     - user: mongodb
#     - group: mongodb
#     - mode: 644
#     - source: salt://mongodb/files/mongodb.conf
#     - template: jinja
#     - require:
#       - pkg: mongodb-10gen
