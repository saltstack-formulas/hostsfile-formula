hostsfile
=========

Formula to set up name resolution for all members of a salt cluster in /etc/hosts.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``hostsfile``
-------

The default behavior is to add entries to
the hostsfile based on addresses collected
via the `Salt Mine`_ function ``network.ip_addrs``.
This will map minion ids and their regarding 
IPs to the local hosts file.

.. _Salt Mine: http://docs.saltstack.com/topics/mine/

To disable this set ``pillar['hostsfile:sources']``
to a list excluding the member ``'mine'``.
To only use the state ``hostsfile.static``
set ``pillar['hostsfile:sources']`` to
``['pillar]``.

For the default `Salt Mine`_ based approach to 
work you must enable the ``network.ip_addrs`` 
function in pillar or in ``/etc/salt/minion``::

    mine_functions:
      network.ip_addrs: []

The formula works best if the minion id is the fqdn and (if the machines have more than one interface) the desired interface to use for this is configured with the mine function::

    mine_functions:
      network.interfaces: []
      network.ip_addrs:
        - eth1
    mine_interval: 2

If you are already using network.ip_addrs for something else (perhaps another state that wants information on a different interface than hostsfile should use), you can specify a mine alias in pillar to query instead::

    hostsfile:
      alias: hostsfile_interface

    mine_functions:
      hostsfile_interface:
        mine_function: network.ip_addrs
        iface: eth0

By default all minions in mine are added to the hosts file, but that can be overridden too::

    hostsfile:
      filter: '*-thisdatacenter-something'

``hostsfile.hostname``
--------------

Also set and persist the hostname (again - using the minion id). This has so far been most useful on EC2 instances.

Works on RedHat/CentOS 5.X or RedHat/CentOS 6.X and Amazon OS - should also work on Ubuntu/Debian.

``hostsfile.static``
--------------------

Reads IP assignments from the pillar key
``hostsfile:static_entries``. The format
is a mapping from one IP address to a list
of names::

    hostsfile:
        static_entries:
            8.8.8.8:
                - dns.google.com
            198.58.116.50:
                - www.saltstack.com
                - saltstack.com
               
