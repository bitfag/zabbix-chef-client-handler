# zabbix-chef-client-handler Cookbook

This is a small simple cookbook for installing chef handler which reports chef-client run status into zabbix using
zabbix_sender.

Initially it was a part of recipes collection from typo3 project [chef-zabbix-custom-checks](https://github.com/StephenKing/chef-zabbix-custom-checks)
but I decided to separate it to another project in order to minimize cookbook dependencies.

## Features

* You will know whether chef-client working on a node or not
* You will know whether chef-client last run was success and complete or not
* You will know whether chef-client run elapsed time was too long

## Requirements

### Platforms

* Ubuntu
* Debian

### Chef

* Chef 12.0 or later. Probably should work with chef 11 also.

### Cookbooks

* [chef_handler](https://github.com/chef-cookbooks/chef_handler)

## Attributes

* `default['zabbix']['bin_dir']` - directory where zabbix_sender are stored
* `default['zabbix']['etc_dir']` - directory where zabbix_agent.conf are stored

## License and Authors

Author:: [Vladimir Kamarzin][bitfag] (<vvk@vvk.pp.ru>)
Author:: [Steffen Gebert][stephenking] (<steffen.gebert@typo3.org>)

Copyright 2011, 2012, Steffen Gebert for TYPO3 Association
Copyright 2016, Vladimir Kamarzin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

