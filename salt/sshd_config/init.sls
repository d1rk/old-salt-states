ssh:
  service.running

Disable root login:
  augeas.setvalue:
    - name: /files/etc/ssh/sshd_config/PermitRootLogin
    - value: "no"
    - watch_in:
      - service: ssh

Disable password authentication:
  augeas.setvalue:
    - name: /files/etc/ssh/sshd_config/PasswordAuthentication
    - value: "no"
    - watch_in:
      - service: ssh

