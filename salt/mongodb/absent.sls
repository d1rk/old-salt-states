mongodb-10gen:
  pkg:
    - removed

mongodb:
  service:
    - disabled
    - enable: False
    - require:
      - pkg: mongodb-10gen

remove-key:
  cmd.run:
    - name: apt-key del "Richard Kreuter <richard@10gen.com>"
    - onlyif: apt-key list | grep 10gen

mongo-files:
  file:
    - absent
    - names:
      - /etc/mongodb.conf
      - /etc/apt/sources.list.d/mongodb.list
      - /var/log/mongodb
