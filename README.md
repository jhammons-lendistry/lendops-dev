# VVV

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/206b06167aaf48aab24422cd417e8afa)](https://www.codacy.com/gh/Varying-Vagrant-Vagrants/VVV?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Varying-Vagrant-Vagrants/VVV&amp;utm_campaign=Badge_Grade) [![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/varying-vagrant-vagrants/vvv.svg)](http://isitmaintained.com/project/varying-vagrant-vagrants/vvv "Average time to resolve an issue") [![Percentage of issues still open](http://isitmaintained.com/badge/open/varying-vagrant-vagrants/vvv.svg)](http://isitmaintained.com/project/varying-vagrant-vagrants/vvv "Percentage of issues still open")

VVV is a local developer environment, mainly aimed at [WordPress](https://wordpress.org) developers. It uses [Vagrant](https://www.vagrantup.com) and Docker/VirtualBox/Parallels/HyperV to create a linux server environment for building sites, and contributing to WordPress itself.

_VVV stands for Varying Vagrant Vagrants._

## How To Use

To use it, download and install [Vagrant](https://www.vagrantup.com) and a provider such as [VirtualBox](https://www.virtualbox.org/), Docker, or Parallels Pro. Then, clone this repository and run:

```shell
vagrant plugin install --local
vagrant up --provision
```

## Handling Database Backups & WordPress public_html Folders

1. Edit config/config.yaml and set the folders directive for public_html;
2. Set the repo to a repository with the base public_html/ folder of WordPress files/content/etc.
3. Ensure you have or create a backup of the MySQL database (either from existing git repo or generated yourself) by placing it in databases/sql/backup/poc_lendistry-devel_net.sql for Vagrant provisioning.

Export a database from a running (local VM) site like so:

```
$ vagrant ssh -c 'mysqldump poc_lendistry-devel_net' > database/sql/backups/poc_lendistry-devel_net.sql
```

... or to store it in the git repo (to push to staging, for example):

  ```
$ vagrant ssh -c 'mysqldump poc_lendistry-devel_net' > www/poc_lendistry-devel_net/public_html/poc_lendistry-devel_net.sql
```

## Handling Site WordPress Customizatons

See the www/ folder, for example the poc_lendistry-devel_net/ folder (its own git repository as described in config/config.yml).

## Accessing Local VVV

When it's done, visit [http://vvv.test](http://vvv.test).

The online documentation contains more detailed [installation instructions](https://varyingvagrantvagrants.org/docs/en-US/installation/).

* **Web**: [https://varyingvagrantvagrants.org/](https://varyingvagrantvagrants.org/)
* **Contributing**: Contributions are more than welcome. Please see our current [contributing guidelines](https://varyingvagrantvagrants.org/docs/en-US/contributing/). Thanks!

## Minimum System requirements

[For system requirements, please read the system requirements documentation here](https://varyingvagrantvagrants.org/docs/en-US/installation/software-requirements/)

## Software included

For a comprehensive list, please see the [list of installed packages](https://varyingvagrantvagrants.org/docs/en-US/installed-packages/).
