# Set SELinux to Permission
setenforce 0

# Install docker puppet support
puppet module install garethr/docker --modulepath /tmp/vagrant-puppet/environments/production/modules
puppet module install basti1302-wait_for --modulepath /tmp/vagrant-puppet/environments/production/modules
puppet module install puppetlabs/firewall --modulepath /tmp/vagrant-puppet/environments/production/modules
