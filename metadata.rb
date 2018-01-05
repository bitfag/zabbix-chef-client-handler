name 'zabbix-chef-client-handler'
maintainer 'Vladimir Kamarzin'
maintainer_email 'vvk@vvk.pp.ru'
license 'Apache-2.0'
description 'Installs and uses a chef-handler for reporting to Zabbix'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'
chef_version '>= 11.0' if respond_to?(:chef_version)
issues_url 'https://github.com/bitfag/zabbix-chef-client-handler/issues' if respond_to?(:issues_url)
source_url 'https://github.com/bitfag/zabbix-chef-client-handler' if respond_to?(:source_url)

depends "chef_handler"

supports 'ubuntu'
supports 'debian'
