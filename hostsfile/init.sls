{% set sources = salt['pillar.get'](
    'hostsfile:sources', ['mine']) %}
{%- if 'pillar' in sources %}
include:
    - hostsfile.static
{%- endif %}

{%- if 'mine' in sources %}
# populate /etc/hosts with names and IP entries from your salt cluster
# the minion id has to be the fqdn for this to work

{%- set fqdn = grains['id'] %}
# example configuration for /etc/salt/minion:
#
# mine_functions:
#  network.ip_addrs:
#    - eth1
#  mine_interval: 2

{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set minion_filter = salt['pillar.get']('hostsfile:filter', '*') %}

{%- set addrs = salt['mine.get'](minion_filter, minealias) %}

{%- if addrs is defined %}

{%- for name, addrlist in addrs.items() %}
{{ name }}-host-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - {{ name }}
{% endfor %}

{% endif %}
{% endif %}
