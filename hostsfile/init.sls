# populate /etc/hosts with names and IP entries from your salt cluster
# the minion id has to be the fqdn for this to work

{%- set fqdn = grains['id'] %}
# example configuration for /etc/salt/minion:
#
# mine_functions:
#  network.ip_addrs:
#    - eth1
#  mine_interval: 2

{%- set addrs = salt['mine.get']('*', 'network.ip_addrs') %}

{%- if addrs is defined %}
{%- set if = grains['maintain_hostsfile_interface'] %}

{%- for name, addrlist in addrs.items() %}
{%- set short_name = name.split('.') | first %}
{{ name }}-host-entry:
  host.present:
    - ip: {{ addrlist|first() }}
    - names:
      - {{ name }}
{%- if short_name != name and salt['pillar.get']('hostsfile:generate_shortname', True) %}
      - {{ short_name }}
{%- endif %}

{% endfor %}

{% endif %}

