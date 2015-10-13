# This is currently intended for ec2 hosts that come with sth like ip-10-10-0-123 for a hostname.
# To match the hostname with the entries created by the hostsfile state, also execute this state.

{%- set fqdn = grains['id'] %}
{%- set localip = grains['fqdn_ip4'] %}
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

{%- if grains['os_family'] == 'Suse' %}
/etc/HOSTNAME:
  file.managed:
    - contents: {{ fqdn }}
    - backup: false
{% else %}
/etc/hostname:
  file.managed:
    - contents: {{ fqdn }}
    - backup: false
{{ fqdn }}-hosts-entry:
  host.present:
    - ip: {{ localip }}
    - names:
      - {{ fqdn }}
{% endif %}

set-fqdn:
  cmd.run:
    - name: hostname {{ fqdn }}
    - unless: test "{{ fqdn }}" == "$(hostname)"
