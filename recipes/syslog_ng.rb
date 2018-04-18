include_recipe 'yum-epel'

package 'syslog-ng'

service 'syslog-ng' do
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end

template '/etc/syslog-ng/syslog-ng.conf' do
  mode '0644'
  owner 'root'
  source 'etc_syslog_ng.conf.erb'
  notifies :restart, 'service[syslog-ng]'
end
