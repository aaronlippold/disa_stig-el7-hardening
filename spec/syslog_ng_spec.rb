require 'spec_helper'

describe 'stig::syslog_ng CentOS 7.x' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '7.3.1611').converge('stig::syslog_ng') }

  it 'creates /etc/rsyslog.conf template' do
    expect(chef_run).to create_template('/etc/syslog-ng/syslog-ng.conf').with(
      source: 'etc_syslog_ng.conf.erb',
      owner: 'root',
      group: 'root',
      mode: 0o644
    )
  end
end

describe 'stig::syslog_ng CentOS 6.x' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.7').converge('stig::syslog_ng') }

  it 'creates /etc/syslog-ng.conf template' do
    expect(chef_run).to create_template('/etc/syslog-ng/syslog-ng.conf').with(
      source: 'etc_syslog_ng.conf.erb',
      owner: 'root',
      group: 'root',
      mode: 0o644
    )
  end
end