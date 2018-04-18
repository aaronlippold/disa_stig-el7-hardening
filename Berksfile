source 'https://supermarket.getchef.com'

metadata

cookbook 'auditd', '~> 2.2.0'
cookbook 'logrotate', '~> 2.2.0'
cookbook 'sysctl', '~> 0.10.2'

# The following is optional and only used if testing on the DOI network
cookbook 'doi_ssl_filtering', github: 'USGS-CIDA/chef-cookbook-doi-ssl-filtering', tag: 'v1.0.6'

#following includes nginx hardening cookbook
cookbook 'nginx-hardening', git: 'https://github.com/aaronlippold/chef-nginx-hardening.git'

cookbook 'syslog-ng', github: 'logankoester/chef-syslog-ng', branch: 'master'

cookbook 'apt'
cookbook 'build-essential'
cookbook 'yum-epel'
cookbook 'zypper'
cookbook 'nginx'
