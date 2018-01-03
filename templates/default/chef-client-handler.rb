#
# Author:: Vladimir Kamarzin (vvk@vvk.pp.ru)
# Author:: Steffen Gebert (steffen.gebert@typo3.org)
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

require 'rubygems'
require 'chef/log'
require 'chef'
require 'tempfile'

module Zabbix
  class Report < Chef::Handler
    def report

      Chef::Log.info "Zabbix::Report handler started"

      prefix = "custom.chef-client.last_run"
      file = Tempfile.new('client-handler-zabbix-report')
      host_name = node['zabbix-handler']['hostname']
      
      message = [
        "#{host_name} #{prefix}.success #{run_status.success? ? 1 : 0}",
        "#{host_name} #{prefix}.elapsed_time #{run_status.elapsed_time}",
        "#{host_name} #{prefix}.start_time #{run_status.start_time.to_i}",
        "#{host_name} #{prefix}.end_time #{run_status.end_time.to_i}",
        "#{host_name} #{prefix}.all_resources_num #{run_status.all_resources.length}",
        "#{host_name} #{prefix}.updated_resources_num #{run_status.updated_resources.length}",
      ].join("\n")

      file.write(message)
      file.close()
      cmd = [File.join(node['zabbix-handler']['bin_dir'], "zabbix_sender"), "--config", File.join(node['zabbix-handler']['etc_dir'], "zabbix_agentd.conf"), "--input-file", file.path]
      Chef::Log.debug "Sending to zabbix: #{message}"
      Chef::Log.debug "Command #{cmd.join(" ")}"
      if RUBY_VERSION < "1.9"
        out = IO.popen(cmd.join(" "))
      else
        out = IO.popen(cmd)
      end
      Chef::Log.debug "output #{out.readlines}"
      out.close
    end
  end
end
