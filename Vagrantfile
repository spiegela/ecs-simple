# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'puppetlabs/centos-7.0-64-puppet'

  config.vm.network :forwarded_port, host: 443, guest: 443
  config.vm.network :forwarded_port, host: 64443, guest: 64443
  config.vm.network :forwarded_port, host: 4443, guest: 4443
  config.vm.network :forwarded_port, host: 9011, guest: 9011
  config.vm.network :forwarded_port, host: 9020, guest: 9020
  config.vm.network :forwarded_port, host: 9024, guest: 9024

  config.vm.hostname = 'ecs-01'

  dir = "#{ENV['PWD']}/.vagrant/additional-disks"
  Dir.mkdir dir unless File.directory?(dir)

  config.vm.network "private_network", ip: "192.168.81.2"

  config.vm.provider :vmware_fusion do |v|
    file_to_disk = "#{dir}/hd2.vmdk"
    vdiskmanager = '/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager'
    if ARGV[0] == "up"
      unless File.exists?( file_to_disk )
        `#{vdiskmanager} -c -s 100GB -a lsilogic -t 0 #{file_to_disk}`
      end
      v.vmx['memsize'] = '14336'
      v.vmx['scsi0:1.filename'] = file_to_disk
      v.vmx['scsi0:1.present']  = 'TRUE'
    elsif ARGV[0] == "destroy"
      `rm -f #{file_to_disk}`
    end
  end

  config.vm.provider :virtualbox do |v|
    file_to_disk = "#{dir}/hd2.vdi"
    if ARGV[0] == "up"
      unless File.exists?( file_to_disk )
        v.customize ['createhd', '--filename', file_to_disk, '--size', 100 * 1024]
      end
      v.customize [ 'storageattach', :id, '--storagectl', 'IDE Controller',
                            '--port', 1, '--device', 0, '--type', 'hdd', '--medium',
                            file_to_disk ]
    end
  end

  config.vm.provision 'shell', path: 'enable_emc_certs.sh'
  config.vm.provision 'shell', path: './bootstrap.sh'

  config.vm.provision 'puppet' do |p|
    p.environment = 'production'
    p.environment_path = 'environments'
    p.working_directory = '/tmp/vagrant-puppet/environments/production'
  end

end
