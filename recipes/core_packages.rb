
platform = node['platform']

package %w[vim git]

execute 'Run YUM upgrade' do
  command 'yum -y upgrade'
  only_if { %w[rhel fedora centos redhat].include? platform }
end

apt_update 'update'

execute 'Run APT upgrade' do
  command 'apt-get -y upgrade'
  only_if { %w[debian ubuntu].include? platform }
end
