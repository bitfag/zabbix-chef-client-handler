#
# Author:: Vladimir Kamarzin (vvk@vvk.pp.ru)
# Author:: Steffen Gebert (steffen.gebert@typo3.org)
# Cookbook Name:: zabbix-chef-client-handler 
# Attributes:: default
#
# Copyright 2011, 2012, Steffen Gebert for TYPO3 Association
# Copyright 2016, Vladimir Kamarzin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['zabbix-handler']['bin_dir'] = '/usr/bin/'
default['zabbix-handler']['etc_dir'] = '/etc/zabbix/'
default['zabbix-handler']['hostname'] = node['fqdn']
