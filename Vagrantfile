# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "codekipple/ubuntu-trusty32-latestpuppet"

  if ENV['vm_stages'] == "no"
    _stages = "no"
  else
    _stages = "yes"
  end

  # Networking
  config.vm.network "private_network", type: "dhcp"

  # Due to some issues with the ssh keys that arises when a
  # VM becomes disassociated with vagrant we are just using
  # username and password for now even though it's not as secure
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder.
  config.vm.synced_folder "../", "/var/www"

  # Provider (VirtualBox, VMWare, ect) configuration
  # Using VirtualBox:
  config.vm.provider :virtualbox do |vb|
    # Boot without headless mode
    vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]

    # Via http://blog.liip.ch/archive/2012/07/25/vagrant-and-node-js-quick-tip.html
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Provisioning (puppet, chef, ansible, salt, .sh ect) configuration
  # Using Puppet
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
    puppet.module_path = "modules"
    puppet.hiera_config_path = 'hiera/hiera.yaml' # path on host machine
    puppet.working_directory = '/vagrant' # Relative path for hiera data directories

    # use facter to pass a hash of variables to puppet set as facter variables
    puppet.facter = {
      "stages" => _stages
    }

    # puppet.options = "--verbose --debug"
  end
end