# This is currently intended for ec2 hosts that come with sth like ip-10-10-0-123 for a hostname.
# To match the hostname with the entries created by the hostsfile state, also execute this state.

{%- set fqdn = grains['id'] %}
{%- if grains['os_family'] == 'RedHat' %}

etc-sysconfig-network:
  cmd.run:
    - name: echo -e "NETWORKING=yes\nHOSTNAME={{ fqdn }}\n" > /etc/sysconfig/network
    - unless: test -f /etc/sysconfig/network
  file.replace:
    - name: /etc/sysconfig/network
    - pattern: HOSTNAME=localhost.localdomain
    - repl: HOSTNAME={{ fqdn }}

{% endif %}

/etc/hostname:
  file.managed:
    - contents: {{ fqdn }}
    - backup: false

set-fqdn:
  cmd.run:
    - name: hostname {{ fqdn }}
    - unless: test "{{ fqdn }}" == "$(hostname)"
