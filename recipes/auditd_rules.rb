# Cookbook Name:: stig
# Recipe:: auditd_rules
# Author: Ivan Suftin <isuftin@usgs.gov>
# Description: Add this recipe in your cookbook and pass in
# attributes for rule sets or use the defaults below

template '/etc/audit/rules.d/audit.rules' do
  source 'audit_rules.erb'
  mode '0640'
  owner 'root'
  group 'root'
  variables(buffer: node.default['stig']['auditd']['buffer'],
            failure_mode: node.default['stig']['auditd']['failure_mode'],
            rules: node.default['stig']['auditd']['rules'])
  notifies :restart, 'service[auditd]', :immediately
end
