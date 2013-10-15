dotdeb:
  pkgrepo.managed:
    - name: deb http://packages.dotdeb.org wheezy all
    - dist: wheezy
    - file: /etc/apt/sources.list.d/dotdeb.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg
    - require_in:
      - pkg: dotdeb

/etc/apt/sources.list.d/dotdeb.list:
 file.managed:
   - source: salt://dotdeb/files/dotdeb.list

/etc/apt/preferences.d/dotdeb:
 file.managed:
   - source: salt://dotdeb/files/dotdeb.preference

