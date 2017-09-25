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
{%- set minions = salt['pillar.get']('hostsfile:minions', '*') %}
{%- set minions_type = salt['pillar.get']('hostsfile:type', 'glob')%}
{%- set hosts = {} %}
{%- set pillar_hosts = salt['pillar.get']('hostsfile:hosts', {}) %}
{%- set mine_hosts = salt['mine.get'](minions, minealias, expr_form=minions_type) %}
{%- if mine_hosts is defined %}
{%-   do hosts.update(mine_hosts) %}
{%- endif %}
{%- do hosts.update(pillar_hosts) %}

{%- set domain = salt.pillar.get('hostsfile:domain', '') %}
{%- for name, addrlist in hosts.items() %}
{{ name }}-host-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - {{ name }}
  {%- if domain %}
      - {{ name }}.{{ domain }}
  {%- endif %}
{% endfor %}
