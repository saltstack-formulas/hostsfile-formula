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

Uses the `Salt Mine <http://docs.saltstack.com/topics/mine/>`_ function ``network.ip_addrs`` to add minion ids and their regarding ips to the local hosts file.

At a minimum, you must enable the network.ip_addrs function in pillar or in ``/etc/salt/minion``::

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
      minions: '*-thisdatacenter-something'

By default specified minions in mine are added to the hosts file::

    hostsfile:
      minions: 'zk[1-5] and kafka[1-5]'
      type: 'compound'

And you can add explicit entries for non-mine hosts as well::

    hostsfile:
      hosts:
        server1: 10.10.10.10
        server2: 10.10.10.11

To reduce the hostnames for an IP to those given in pillar
you can place them in ``pillar[hostsfile:only]``::

    hostsfile:
      only:
        10.10.10.10:
            - server1.my.domain
            - server1
        10.10.10.11:
            - server2.my.domain
            - server2

To remove an IP from the hostsfile specify an empty list
of hostnames::

    hostsfile:
        only:
            127.0.1.1: []

``hostsfile.hostname``
--------------

Also set and persist the hostname (again - using the minion id). This has so far been most useful on EC2 instances.

Works on RedHat/CentOS 5.X or RedHat/CentOS 6.X and Amazon OS - should also work on Ubuntu/Debian.
