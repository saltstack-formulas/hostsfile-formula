.. _readme:

hostsfile
=========

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/hostsfile-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/hostsfile-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to set up name resolution for all members of a salt cluster in /etc/hosts.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please pay attention to the ``pillar.example`` file and/or `Special notes`_ section.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Special notes
-------------

To enable the Salt Mine the `mine_functions` option `needs to be applied to a Minion <https://docs.saltproject.io/en/latest/topics/mine/#mine-functions>`_

Available states
----------------

.. contents::
   :local:

``hostsfile``
^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^

Also set and persist the hostname (again - using the minion id). This has so far been most useful on EC2 instances.

Works on RedHat/CentOS 5.X or RedHat/CentOS 6.X and Amazon OS - should also work on Ubuntu/Debian.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``TEMPLATE`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

