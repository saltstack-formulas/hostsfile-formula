# this is currently intended for ec2 hosts that come with sth like ip-10-10-0-123 for a hostname
# to match the hostname with the entries created by the hostsfile state, also execute this one

{%- set fqdn = grains['id'] %}
{%- if grains['os_family'] == 'RedHat' %}
/etc/sysconfig/network:
  file.replace:
    - pattern: HOSTNAME=localhost.localdomain
    - repl: HOSTNAME={{ fqdn }}
    - backup: false
{%- elif grains['os_family'] == 'Debian' %}
/etc/hostname:
  file.managed:
    - contents: {{ fqdn }}
    - backup: false
{% endif %}

set-fqdn:
  cmd.run:
    - name: hostname {{ fqdn }}
    - unless: test "{{ fqdn }}" == "$(hostname)"
