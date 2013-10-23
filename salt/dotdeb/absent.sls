remove-key:
  cmd.run:
    - name: apt-key del "Guillaume Plessis <gui@dotdeb.org>"
    - onlyif: apt-key list | grep dotdeb

dotdeb-files:
  file:
    - absent
    - names:
      - /etc/apt/sources.list.d/dotdeb.list
      - /etc/apt/preferences.d/dotdeb
