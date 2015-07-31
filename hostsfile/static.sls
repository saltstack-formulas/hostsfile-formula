# populate /etc/hosts with names and IP entries from pillar
{%- set addrs = salt['pillar.get'](
        'hostsfile:static_entries', {}) %}
{%- if addrs %}
    {%- for addr, names in addrs.items() %}
{{ names|first }}_static-host-entry:
  host.present:
    - ip: {{ addr }}
    - names:
        {%- for name in names %}
      - {{ name }}
        {%- endfor %}
    {% endfor %}
{% endif %}
