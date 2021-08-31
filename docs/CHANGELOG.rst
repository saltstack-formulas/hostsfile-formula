
Changelog
=========

`0.9.0 <https://github.com/saltstack-formulas/hostsfile-formula/compare/v0.8.2...v0.9.0>`_ (2021-08-31)
-----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **changes:** set-fqdn should not alwasy change state (\ `101fdc5 <https://github.com/saltstack-formulas/hostsfile-formula/commit/101fdc5c5d015a5466494f78d5c4cb2773a5c280>`_\ )
* **hostsfile:** do not add garbage if no alias (\ `26ebda1 <https://github.com/saltstack-formulas/hostsfile-formula/commit/26ebda12393234706a1e9f73f713a11d75bbe533>`_\ )

Features
^^^^^^^^


* **hostname:** add hostname to /etc/hosts (\ `acdb8f7 <https://github.com/saltstack-formulas/hostsfile-formula/commit/acdb8f7c4e634920e210ac8cbbd382c8a33c53fd>`_\ )

`0.8.2 <https://github.com/saltstack-formulas/hostsfile-formula/compare/v0.8.1...v0.8.2>`_ (2021-08-31)
-----------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **3003.1:** update inc. AlmaLinux, Rocky & ``rst-lint`` [skip ci] (\ `6acd523 <https://github.com/saltstack-formulas/hostsfile-formula/commit/6acd5236ca035952b7289a71143c705a0f7a9d82>`_\ )
* **commitlint:** ensure ``upstream/master`` uses main repo URL [skip ci] (\ `22d1ea9 <https://github.com/saltstack-formulas/hostsfile-formula/commit/22d1ea9addf65319b4602e5a7dfd458f1ab64933>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``inspec`` repo [skip ci] (\ `ffef74e <https://github.com/saltstack-formulas/hostsfile-formula/commit/ffef74ef9d5626de4c0f8ead41453fd43b3e8738>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``kitchen-docker`` repo [skip ci] (\ `beda99c <https://github.com/saltstack-formulas/hostsfile-formula/commit/beda99cd87f43646be5d2303c5e295278e2e78da>`_\ )
* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `9d1bc8c <https://github.com/saltstack-formulas/hostsfile-formula/commit/9d1bc8c22e4064a8c2c92cae32cab045550e8486>`_\ )
* **kitchen:** move ``provisioner`` block & update ``run_command`` [skip ci] (\ `bae85e9 <https://github.com/saltstack-formulas/hostsfile-formula/commit/bae85e95d223105fdccc4c5ab3cfc742f5a46866>`_\ )
* **kitchen+ci:** update with latest ``3003.2`` pre-salted images [skip ci] (\ `a560e5e <https://github.com/saltstack-formulas/hostsfile-formula/commit/a560e5e98b1a6bf30fa43c012dbcde996133ea87>`_\ )
* add Debian 11 Bullseye & update ``yamllint`` configuration [skip ci] (\ `24fee1b <https://github.com/saltstack-formulas/hostsfile-formula/commit/24fee1be0264365993e2f0e293a3aa97b9d52d05>`_\ )
* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `5778e4a <https://github.com/saltstack-formulas/hostsfile-formula/commit/5778e4a4b0e0e3eb381340d8a4f51e372f8c3e1b>`_\ )
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] (\ `5711cd8 <https://github.com/saltstack-formulas/hostsfile-formula/commit/5711cd81b6b8934f585b4fa944c84b2c124479b2>`_\ )
* **kitchen+gitlab:** adjust matrix to add ``3003`` [skip ci] (\ `7b4c896 <https://github.com/saltstack-formulas/hostsfile-formula/commit/7b4c896f91737e530e960ecefee67ef59b109d27>`_\ )
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] (\ `2992342 <https://github.com/saltstack-formulas/hostsfile-formula/commit/2992342f2b3c91f4e98d51db92b6847cb556b829>`_\ )
* add ``arch-master`` to matrix and update ``.travis.yml`` [skip ci] (\ `7f9b8a6 <https://github.com/saltstack-formulas/hostsfile-formula/commit/7f9b8a6f840095737a60e9ce3a26db7992e196ad>`_\ )
* **gitlab-ci:** add ``rubocop`` linter (with ``allow_failure``\ ) [skip ci] (\ `ab8f84b <https://github.com/saltstack-formulas/hostsfile-formula/commit/ab8f84bae8ac4a7872d0c74aecac9c46f736f62e>`_\ )
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] (\ `7600dd8 <https://github.com/saltstack-formulas/hostsfile-formula/commit/7600dd8795a2ac149ffd8d734a690b9feb0f74bd>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `9fc89f3 <https://github.com/saltstack-formulas/hostsfile-formula/commit/9fc89f3c1caae545698391eb382f568243e2d0b1>`_\ )
* **pre-commit:** add to formula [skip ci] (\ `aff03a5 <https://github.com/saltstack-formulas/hostsfile-formula/commit/aff03a51f55e704df7d1ceca5d654edcf9f30c86>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `7e003ef <https://github.com/saltstack-formulas/hostsfile-formula/commit/7e003ef1e9fe0726cb7c9ce9d6fd7537a1351ece>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `d6a4e2a <https://github.com/saltstack-formulas/hostsfile-formula/commit/d6a4e2af9960ee2dd3bc7602ac85c33f4063ea81>`_\ )
* **pre-commit:** update hook for ``rubocop`` [skip ci] (\ `39bdd86 <https://github.com/saltstack-formulas/hostsfile-formula/commit/39bdd868685b80151c880ccadc3a00b1acc2ec53>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `ac03dd8 <https://github.com/saltstack-formulas/hostsfile-formula/commit/ac03dd8862bdac3bc0bfd43f5449c529155abe7b>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `6cb1173 <https://github.com/saltstack-formulas/hostsfile-formula/commit/6cb117394d2342ff25f9688f6b8f788c15a5572e>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** add note about mine func (\ `9727c24 <https://github.com/saltstack-formulas/hostsfile-formula/commit/9727c24b4e6188ffe78256d0b70ac102543077bd>`_\ )

Tests
^^^^^


* standardise use of ``share`` suite & ``_mapdata`` state [skip ci] (\ `ba749c9 <https://github.com/saltstack-formulas/hostsfile-formula/commit/ba749c9399eb2caec838f8234fb9483f737d6678>`_\ )

`0.8.1 <https://github.com/saltstack-formulas/hostsfile-formula/compare/v0.8.0...v0.8.1>`_ (2020-04-28)
-----------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **init:** use ``salt['pillar.get']`` to avoid bogus entries (\ `ac98bb8 <https://github.com/saltstack-formulas/hostsfile-formula/commit/ac98bb84d7492c1420557ffb0ae09855199f1b12>`_\ ), closes `#26 <https://github.com/saltstack-formulas/hostsfile-formula/issues/26>`_

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `cc147ec <https://github.com/saltstack-formulas/hostsfile-formula/commit/cc147ec0e72f0a4b9014d001e008216de13eb208>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `01ca5cc <https://github.com/saltstack-formulas/hostsfile-formula/commit/01ca5cc62af94aff2116190f85a5539c709701ce>`_\ )

`0.8.0 <https://github.com/saltstack-formulas/hostsfile-formula/compare/v0.7.1...v0.8.0>`_ (2020-01-20)
-----------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* implement basic inspec tests (\ `e41fca6 <https://github.com/saltstack-formulas/hostsfile-formula/commit/e41fca66b0cad1bd9e3a1c8f817e307fdb6641eb>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** modify according to standard structure (\ `69b6ce6 <https://github.com/saltstack-formulas/hostsfile-formula/commit/69b6ce60c17f9370ec9d95134320289da724d890>`_\ )

Features
^^^^^^^^


* **semantic-release:** standardise implementation (\ `ec3a60b <https://github.com/saltstack-formulas/hostsfile-formula/commit/ec3a60b13092f41976e0c963ecd2c6b458be558f>`_\ )
* implementing semantic release (\ `cb383e8 <https://github.com/saltstack-formulas/hostsfile-formula/commit/cb383e8367af656d0e47ad38543f0f30e61c9336>`_\ )
