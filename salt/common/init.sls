base:
  pkg.installed:
    - pkgs:
      - htop
      - iftop
      - iotop
      - nload
      - etckeeper
      - unp
      - mc
      - vim
      - pciutils
      - lsof
      - debian-goodies

build-essential:
  pkg.installed

python-pip:
  pkg.installed

python-dev:
  pkg.installed

glances:
  pip.installed:
    - name: glances
    - require:
      - pkg: build-essential
      - pkg: python-pip
      - pkg: python-dev