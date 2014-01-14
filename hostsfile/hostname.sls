# This is currently intended for ec2 hosts that come with sth like ip-10-10-0-123 for a hostname.
# To match the hostname with the entries created by the hostsfile state, also execute this state.
# python-augeas is needed to persist the hostname on Redhat-based systems.

{%- set fqdn = grains['id'] %}
{%- if grains['os_family'] == 'RedHat' %}

# augeas is used here to provide a minimal network file (where none existed)
# without wiping out unrelated lines in a pre-existing file

etc-sysconfig-network:
  augeas.setvalue:
    - prefix: /files/etc/sysconfig/network
    - changes:
      - NETWORKING: 'yes'
      - HOSTNAME: {{ fqdn }}

{% endif %}

/etc/hostname:
  file.managed:
    - contents: {{ fqdn }}
    - backup: false

set-fqdn:
  cmd.run:
    - name: hostname {{ fqdn }}
    - unless: test "{{ fqdn }}" == "$(hostname)"
