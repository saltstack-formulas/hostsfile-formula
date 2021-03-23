# -*- coding: utf-8 -*-
# vim: ft=sls
---
{%- do salt["log.debug"]("### MAP.JINJA DUMP -- no `map.jinja` to dump! ###\n") %}
hostsfile-no-map.jinja-to-dump:
  test.succeed_without_changes:
    - name: |
        This formula doesn't have a `map.jinja` to dump!
